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

$mkvpropedit = "C:\Program Files\MKVToolNix\mkvpropedit.exe"
$mkvmerge    = "C:\Program Files\MKVToolNix\mkvmerge.exe"

if (-not (Test-Path $mkvpropedit)) { Write-Error "mkvpropedit not found"; exit }
if (-not (Test-Path $FilePath)) { Write-Error "File not found: $FilePath"; exit }

Write-Host "Processing: $FilePath"

# 2. Get JSON metadata
$jsonInfo = &$mkvmerge --ui-language en -J $FilePath | ConvertFrom-Json

# 3. Filter for subtitle tracks
[array]$subTracks = $jsonInfo.tracks | Where-Object { $_.type -eq "subtitles" }

# 4. Build command arguments
# We use a List object for easier manipulation of arguments
$mkvArgs = New-Object System.Collections.Generic.List[string]
$mkvArgs.Add($FilePath)

# Global Cleanup
$mkvArgs.Add("--edit")
$mkvArgs.Add("info")
$mkvArgs.Add("--set")
$mkvArgs.Add("title=")
$mkvArgs.Add("--tags")
$mkvArgs.Add("all:")

# 5. Process subtitles
if ($subTracks.Count -gt 0) {
    foreach ($track in $subTracks) {
        $trackNum = $track.id + 1
        $trackName = $track.properties.track_name

        if ($trackName -eq "SDH") {
            $mkvArgs.Add("--edit")
            $mkvArgs.Add("track:$trackNum") # Simplified selector
            $mkvArgs.Add("--set")
            $mkvArgs.Add("flag-default=1")
            $mkvArgs.Add("--set")
            $mkvArgs.Add("flag-hearing-impaired=1")
            Write-Host "Queued SDH flags for Track $trackNum"
        }

        if ($trackName -eq "Forced") {
            $mkvArgs.Add("--edit")
            $mkvArgs.Add("track:$trackNum") # Simplified selector
            $mkvArgs.Add("--set")
            $mkvArgs.Add("flag-default=0")
            $mkvArgs.Add("--set")
            $mkvArgs.Add("flag-forced=1")
            Write-Host "Queued Forced flags for Track $trackNum"
        }
    }
}

# 6. Final Execution
Write-Host "Applying changes..."
# Converting List to Array for the call operator
&$mkvpropedit $mkvArgs.ToArray()

Write-Host "Metadata update complete."
