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

# 1. Verification: Only proceed if Handbrake succeeded (Exit Code 0)
if ($ExitCode -ne 0) {
    Write-Warning "Handbrake reported a non-zero exit code ($ExitCode). Skipping metadata processing."
    exit
}

# Path to your MKVToolNix executables
$mkvpropedit = "C:\Program Files\MKVToolNix\mkvpropedit.exe"
$mkvmerge    = "C:\Program Files\MKVToolNix\mkvmerge.exe"

if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit
}

Write-Host "Handbrake Success. Processing: $FilePath"

# 2. Get JSON metadata using mkvmerge
$jsonInfo = &$mkvmerge -J $FilePath | ConvertFrom-Json

# 3. Check if there are any subtitle tracks at all
$subTracks = $jsonInfo.tracks | Where-Object { $_.type -eq "subtitles" }

if ($null -eq $subTracks -or $subTracks.Count -eq 0) {
    Write-Host "No subtitle tracks found. Clearing global tags/title and exiting."
    # We still perform the global cleanup as requested in previous requirements
    &$mkvpropedit "`$FilePath`" --edit info --set "title=" --tags "all:"
    exit
}

# 4. Build command arguments for mkvpropedit
$arguments = @(
    "`"$FilePath`"",
    "--edit", "info", "--set", "title=",
    "--tags", "all:"
)

foreach ($track in $subTracks) {
    # mkvpropedit track selection is 1-based
    $trackNum = $track.id + 1
    $trackName = $track.properties.track_name

    # SDH Logic: Mark as Default + Hearing Impaired
    if ($trackName -eq "SDH") {
        $arguments += "--edit", "track:n$trackNum"
        $arguments += "--set", "flag-default=1"
        $arguments += "--set", "flag-hearing-impaired=1"
        Write-Host "Found SDH on Track $trackNum."
    }

    # Forced Logic: Mark as Forced + NOT Default
    if ($trackName -eq "Forced") {
        $arguments += "--edit", "track:n$trackNum"
        $arguments += "--set", "flag-default=0"
        $arguments += "--set", "flag-forced=1"
        Write-Host "Found Forced on Track $trackNum."
    }
}

# 5. Execute the changes
Start-Process -FilePath $mkvpropedit -ArgumentList $arguments -Wait -NoNewWindow
Write-Host "Metadata update complete."
