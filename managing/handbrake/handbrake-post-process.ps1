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

# 1. Exit early if Handbrake failed
if ($ExitCode -ne 0) {
    Write-Warning "Handbrake reported a non-zero exit code ($ExitCode). Skipping metadata processing."
    exit
}

# 2. Define Executable Paths
$mkvpropedit = "C:\Program Files\MKVToolNix\mkvpropedit.exe"
$mkvmerge    = "C:\Program Files\MKVToolNix\mkvmerge.exe"

# Check if executables exist
if (-not (Test-Path $mkvpropedit)) { Write-Error "mkvpropedit not found at $mkvpropedit"; exit }
if (-not (Test-Path $mkvmerge)) { Write-Error "mkvmerge not found at $mkvmerge"; exit }

# Check if video file exists
if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit
}

Write-Host "Processing: $FilePath"

# 3. Get JSON metadata
# Using --ui-language en ensures property names like "tracks" and "type" are consistent
$jsonRaw = &$mkvmerge --ui-language en -J $FilePath
$jsonInfo = $jsonRaw | ConvertFrom-Json

# 4. Filter for subtitle tracks
# Explicitly casting to [array] to ensure .Count works even with 1 track
[array]$subTracks = $jsonInfo.tracks | Where-Object { $_.type -eq "subtitles" }

# 5. Build command arguments (Starting with Global Cleanup)
$mkvArgs = @(
    $FilePath,
    "--edit", "info", "--set", "title=",
    "--tags", "all:"
)

# 6. Process subtitles if any exist
if ($subTracks.Count -gt 0) {
    Write-Host "Found $($subTracks.Count) subtitle track(s)."
    
    foreach ($track in $subTracks) {
        $trackNum = $track.id + 1
        $trackName = $track.properties.track_name

        if ($trackName -eq "SDH") {
            $mkvArgs += "--edit", "track:n${trackNum}"
            $mkvArgs += "--set", "flag-default=1"
            $mkvArgs += "--set", "flag-hearing-impaired=1"
            Write-Host "Modified Track ${trackNum}: Set SDH flags."
        }

        if ($trackName -eq "Forced") {
            $mkvArgs += "--edit", "track:n${trackNum}"
            $mkvArgs += "--set", "flag-default=0"
            $mkvArgs += "--set", "flag-forced=1"
            Write-Host "Modified Track ${trackNum}: Set Forced flags."
        }
    }
} 
else {
    Write-Host "No subtitle tracks detected. Proceeding with global cleanup only."
}

# 7. Final Execution
# Using & with an array is the most robust way to pass complex arguments
Write-Host "Applying changes via mkvpropedit..."
&$mkvpropedit @mkvArgs

Write-Host "Metadata update complete."
