#  How to use with Handbrake:
#  1. In Handbrake, go to Preferences > Advanced
#  2. In the Post-Processing Path, select:
#      C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
#  3. In the Arguments box, enter:
#     -ExecutionPolicy Bypass -File "K:\Pending Encode\handbrake-post-process.ps1" -FilePath "{destination}" -ExitCode {exit_code}

param(
    [string]$FilePath,
    [int]$ExitCode
)

# 1. Verification: Only proceed if Handbrake succeeded
if ($ExitCode -ne 0) {
    Write-Warning "Handbrake reported a non-zero exit code ($ExitCode). Skipping metadata processing."
    exit
}

# Paths to MKVToolNix
$mkvpropedit = "C:\Program Files\MKVToolNix\mkvpropedit.exe"
$mkvmerge    = "C:\Program Files\MKVToolNix\mkvmerge.exe"

if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit
}

Write-Host "Handbrake Success. Processing: $FilePath"

# 2. Get JSON metadata
$jsonInfo = &$mkvmerge --ui-language en -J $FilePath | ConvertFrom-Json

# 3. Filter for subtitle tracks robustly
[array]$subTracks = $jsonInfo.tracks | Where-Object { $_.type -eq "subtitles" }

# 4. Build command arguments (Starting with Global Cleanup)
$arguments = @(
    "`"$FilePath`"",
    "--edit", "info", "--set", "title=",
    "--tags", "all:"
)

# 5. Process subtitles if any exist
if ($subTracks.Count -gt 0) {
    Write-Host "Found $($subTracks.Count) subtitle track(s)."
    
    foreach ($track in $subTracks) {
        $trackNum = $track.id + 1
        $trackName = $track.properties.track_name

        if ($trackName -eq "SDH") {
            $arguments += "--edit", "track:n$trackNum"
            $arguments += "--set", "flag-default=1"
            $arguments += "--set", "flag-hearing-impaired=1"
            Write-Host "Modified Track $trackNum: Set SDH flags."
        }

        if ($trackName -eq "Forced") {
            $arguments += "--edit", "track:n$trackNum"
            $arguments += "--set", "flag-default=0"
            $arguments += "--set", "flag-forced=1"
            Write-Host "Modified Track $trackNum: Set Forced flags."
        }
    }
} 
else {
    Write-Host "No subtitle tracks detected. Proceeding with global cleanup only."
}

# 6. Final Execution
Write-Host "Applying changes via mkvpropedit..."
Start-Process -FilePath $mkvpropedit -ArgumentList $arguments -Wait -NoNewWindow

Write-Host "Metadata update complete."
