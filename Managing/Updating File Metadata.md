# Updating metadata of files after Handbrake completes

Depending on the content of the media and the Handbrake selections, it is encouraged (though not _required_) to update the resulting file to maintain naming and metadata conventions.

## Using MKVToolnixGUI
1. Open MKVToolnixGUI, select the "Header Editor" tab from the navigation, and drag your file into the application
2. "Segment Information"
    * Set the Title field following Plex's preferred `[Name] (Year)` convention (e.g. `The Matrix (1999)`) or delete the field contents entirely (_no_ info is better than _bad_ info)
3. "Video" track
    * Set the Language field to the original language of the media
4. "Audio" tracks
    * The first track should have the "Default" attribute set to True
    * Any subsequent tracks should have the "Default" attribute set to False
5. "Subtitle" tracks
    * The first track should have the "Default" attribute set to True (though Plex does not seem to acknowledge this value)
    * Any subsequent tracks should have the "Default" attribute set to False
    * Any SDH tracks should have the "Hearing impaired" attribute set to True
    * Any Forced tracks (dialogue not in the movie's main spoken language, e.g. if German is spoken briefly in an otherwise-English movie) should have the "Forced" attribute set to True
6. Save the file
