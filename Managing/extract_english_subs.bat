@echo off
setlocal enabledelayedexpansion

echo Extracting English subtitles and scanning for SDH...

for %%F in (*.mkv) do (
    echo Processing "%%F"...

    set "basename=%%~nF"
    set "subdir=!basename!\Original_Subs"

    if not exist "!subdir!" mkdir "!subdir!"

    for /f "tokens=*" %%A in ('mkvmerge -i "%%F"') do (
        set "line=%%A"
        echo !line! | findstr /i "subtitles (eng" >nul
        if !errorlevel! == 0 (
            for /f "tokens=3 delims= " %%B in ("!line!") do (
                set "track_id=%%B"
                set "track_id=!track_id::=!"

                REM Detect subtitle format
                set "ext=sub"
                echo !line! | findstr /i "subrip" >nul && set "ext=srt"
                echo !line! | findstr /i "ass substation" >nul && set "ext=ass"
                echo !line! | findstr /i "pgs" >nul && set "ext=sup"
                echo !line! | findstr /i "vobsub" >nul && set "ext=sub"

                set "outfile=!subdir!\!basename!.eng.track!track_id!.!ext!"
                if exist "!outfile!" (
                    echo Skipping existing file: !outfile!
                ) else (
                    echo Extracting Track !track_id! to !outfile!...
                    mkvextract tracks "%%F" !track_id!:"!outfile!"
                )

            )
        )
    )
)

echo Done!
pause