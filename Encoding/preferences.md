# Handbrake Encoding Preferences

## Goals
* Maximize audio/video quality while staying within reasonable file sizes
  * Target file size: under 6 gb per hour of movie duration (e.g. a 2-hour movie should be 12 gb or less)
* Minimize the need for transcoding on moderately-capable client devices
* Do not strain the server's CPU for longer than absolutely necessary

## Assumptions
* x265/HEVC is sufficiently supported to be considered the default codec
* Primary client devices support x265 video and DTS audio

### Primary supported client devices
* Google TV
* Roku

## Default Behaviors

### Video
* Output to MKV format
* Do not crop video, even to remove black bars – maintain original video dimensions and aspect ratio
* Tune option:
  * Always set to "None"
  * _Exception:_ "Animation" can be used for old-style hand-drawn cartoon media or anime, but should not be used for modern CG

### Audio
#### Track selection
* Keep only the original audio
  * Discard tracks dubbed to a language other than the original (if the movie was meant to have Japanese audio, it will be kept in Japanese)
  * Discard "Audio Description" tracks
  * Discard Commentary tracks
* Prefer DTS-HD format, then DTS format, encode to AAC otherwise
  * Passthrough DTS formats when available
  * Otherwise convert the highest-quality track available to AAC per encoding guidelines below
    * Do not encode to AC3, EAC3, FLAC, OPUS, etc
  * Encode one stereo stream in AAC format for legacy support

#### Naming
* Label tracks according to their channel availability, not their format:
  * e.g. `Surround 5.1` or `Stereo`, not `DTS Surround` or `AAC for Roku` etc

#### When encoding to AAC
* Default track:
  * Maintain the highest available channel mix (e.g. if the source is 7.1, keep that intact)
  * Maximum bitrate: 384 kbps or the original track's value, whichever is lower (do not upscale)
* Compatibility track:
  * Encode from highest-quality source track available
  * Convert to stereo mix
  * Maximum bitrate: 192 kbps or the original track's value, whichever is lower

### Subtitles
#### Track selection
* Keep only English subtitles
* Keep only subtitles for the actual content of the media
  * Discard Commentary subtitles
  * Discard trivia popups, etc
* Keep Forced Subtitle tracks when applicable
* Prefer SDH option when available
  * If both SDH and non-SDH are available, keep only SDH
* Keep only image-based subtitles
  * Text-based formats (SRT, SSA/ASS) should be extracted from the source file and stored alongside the output file
* Never burn subtitles into the video

#### Naming
* Do not include language in the track name (e.g. do not name a track "English")
* SDH tracks should be named "SDH"
* Non-SDH tracks should not have a name
* Forced tracks should be named "Foreign Dialogue"
  * If the media's original language is not English, the subtitle track does not need to be labeled as Forced (e.g. a Japanese movie does not need the English subtitles marked "Forced")
 
# Metadata updates after Handbrake completes

Depending on the content of the media and the Handbrake selections, it is encouraged to use MKVToolnixGUI or jMKVPropEdit to update the resulting file to maintain naming and metadata conventions.

## Using MKVToolnixGUI
1. Open MKVToolnixGUI and select the "Header Editor" tab from the navigation.
2. "Segment Information"
  * Set the Title field following Plex's preferred `[Name] (Year)` convention (e.g. `The Matrix (1999)`)
3. "Video" track
  * Set the Language field to the original language of the media
4. "Audio" tracks
  * Ensure the Language field of each track is the original language of that audio
  * For the first audio track, set the "Default" attribute to True
5. "Subtitle" tracks
  * The first/primary track should have the "Default" attribute set to True
  * Any SDH tracks should have the "Hearing impaired" attribute set to True
  * Any Forced tracks should have the "Forced" attribute set to True
