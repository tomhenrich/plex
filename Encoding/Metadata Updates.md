# Metadata updates after Handbrake completes

Depending on the content of the media and the Handbrake selections, it is encouraged to use MKVToolnixGUI to update the resulting file to maintain naming and metadata conventions.

## Using MKVToolnixGUI
1. Open MKVToolnixGUI, select the "Header Editor" tab from the navigation, and drag your file into the application
2. "Segment Information"
    * Set the Title field following Plex's preferred `[Name] (Year)` convention (e.g. `The Matrix (1999)`)
3. "Video" track
    * Set the Language field to the original language of the media
4. "Audio" tracks
    * Ensure the Language field of each track is the original language of that audio
    * The first track should have the "Default" attribute set to True
    * Any subsequent tracks should have the "Default" attribute set to False
5. "Subtitle" tracks
    * The first track should have the "Default" attribute set to True
    * Any subsequent tracks should have the "Default" attribute set to False
    * Any SDH tracks should have the "Hearing impaired" attribute set to True
    * Any Forced tracks should have the "Forced" attribute set to True
