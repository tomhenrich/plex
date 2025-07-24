# Handbrake Encoding Preferences

## Goals
* Maximize audio/video quality while staying within reasonable file sizes
  * Target file size: under 6 gb per hour of movie duration (e.g. a 2-hour movie should be 12 gb or less)
* Minimize the need for transcoding on moderately-capable client devices
* Do not strain the server's CPU for longer than absolutely necessary

### Assumptions
* x265/HEVC is sufficiently supported to be considered the default codec
* Primary client devices support x265 video and DTS audio
  * If not, the server is sufficiently capable of transcoding these
  * Primary supported client devices:
    * Google TV
    * Roku

## Default Behaviors

### Format and dimensions
* Output to MKV format
* Do not crop video, even to remove black bars – maintain original video dimensions and aspect ratio

### Video
* Encode to `H.265 (x265)` with the framerate set to `Same as source` and `Variable framerate`
* Encoder Preset: `Medium` (typically requires 2-3 hours for an average movie)
  * If possible, set to `Slow` but this usually means 8+ hours to encode an average movie
* Quality Level: default to `18` for most movies
  * Can be set to `20` for older, lower-quality movies
  * Set to `16` for particularly high-profile, visually-impressive movies – or consider just keeping the original remuxed source file instead of encoding at all

### Audio
#### Track selection
* Keep only the original audio associated with the title
  * Discard dubbed language tracks – if the movie was meant to have Japanese audio, it will be kept in Japanese
  * Discard any "Audio Description" or Commentary tracks
* Prefer the original audio format directly from the disc
  * Passthrough the best-available format
  * If keeping a TrueHD format (only for exceptionally high-quality movies), add a more compatible format as the default track
    * Maintain the highest available channel mix (e.g. if the source is 7.1, keep that intact)
    * Maximum bitrate: 512 kbps or the original track's value, whichever is lower (do not upscale)

#### Track naming
* Label tracks according to their channel availability, not their format:
  * e.g. `Surround 5.1` or `Stereo`, not `DTS Surround` or `AAC for Roku`

### Subtitles
#### Track selection
* Keep only English subtitles
* Keep only subtitles for the actual content of the media
  * Discard Commentary subtitles
  * Discard trivia popups or other non-dialogue tracks
* Check the "Default" checkbox for the primary subtitle track and ensure it is listed first in the track order
* Keep Forced Subtitle tracks when applicable
* Prefer SDH subtitles when available
  * If both SDH and non-SDH are available, keep only SDH
* Keep only image-based subtitles within the file
  * Text-based formats (SRT or SSA/ASS) should be extracted from the source file and stored alongside the output file
* Never burn subtitles into the video

#### Track naming
* Do not include language in the track name (e.g. do not name a track "English")
* SDH tracks should be named "SDH"
* Non-SDH tracks should not have a name
* Forced tracks should be named "Foreign Dialogue"
  * If the media's original language is not English, the subtitle track does not need to be labeled as Forced (e.g. a Japanese movie does not need the English subtitles marked "Forced")
