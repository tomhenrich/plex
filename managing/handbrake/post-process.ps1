# How to use with Handbrake
# 1. Open Handbrake.
# 2. Go to Preferences > Advanced.
# 3. In the Post-Processing Path, enter:
#     C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
# 4. In the Arguments box, enter:
#    -ExecutionPolicy Bypass -File "C:\Your\Path\To\ProcessHandbrake.ps1" "{path}"

param([string]$FilePath)

# Path to your mkvpropedit and mkvmerge (for scanning)
$mkvpropedit = "C:\Program Files\MKVToolNix\mkvpropedit.exe"
$mkvmerge    = "C:\Program Files\MKVToolNix\mkvmerge.exe"

# Basic validation
if (-not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit
}

Write-Host "Processing: $FilePath"

# 1. Start building the command arguments
# We start by clearing the global title and deleting all global tags
$arguments = @(
    "`"$FilePath`"",
    "--edit", "info", "--set", "title=",
    "--tags", "all:"
)

# 2. Get JSON metadata to identify track numbers and names
$jsonInfo = &$mkvmerge -J $FilePath | ConvertFrom-Json

foreach ($track in $jsonInfo.tracks) {
    # mkvpropedit track selection uses 1-based indexing for 'n' (e.g., track:n1)
    # The JSON ID is 0-based, so we add 1.
    $trackNum = $track.id + 1
    $trackName = $track.properties.track_name
    $trackType = $track.type

    # Logic for Subtitle Tracks
    if ($trackType -eq "subtitles") {
        
        # SDH Logic: Mark as Default + Hearing Impaired
        if ($trackName -eq "SDH") {
            $arguments += "--edit", "track:n$trackNum"
            $arguments += "--set", "flag-default=1"
            $arguments += "--set", "flag-hearing-impaired=1"
            Write-Host "Modified Track $trackNum (SDH): Set Default and Hearing Impaired."
        }

        # Forced Logic: Mark as Forced + NOT Default
        if ($trackName -eq "Forced") {
            $arguments += "--edit", "track:n$trackNum"
            $arguments += "--set", "flag-default=0"
            $arguments += "--set", "flag-forced=1"
            Write-Host "Modified Track $trackNum (Forced): Set Forced and removed Default."
        }
    }
}

# 3. Execute the accumulated command
Write-Host "Applying metadata changes..."
Start-Process -FilePath $mkvpropedit -ArgumentList $arguments -Wait -NoNewWindow
Write-Host "Process Complete."
