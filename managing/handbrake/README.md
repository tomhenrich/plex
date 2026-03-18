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
    * iOS (iPhone, iPad)
    * Google TV
    * Roku

## Default Selection Preferences

### Format and dimensions

* Output to MKV format
* Do not crop video – maintain original video dimensions and aspect ratio

### Video

* Encode to `H.265 (x265)` with the framerate set to `Same as source` and `Variable framerate`
  * **Exception:** encode to x264 for older/grainy black-and-white movies, as x265 does not perform well for this content
* Encoder Preset: `Medium` (typically requires 2-3 hours for an average movie)
  * If possible, set to `Slow` but this usually means 8+ hours to encode an average movie
* Quality Level: default to `20` for most movies

| Content Type | Quality Level |
| :----------- | :------------ |
| High-profile, visually-impressive content | 18 |
| Default | 20 |
| Old, low-quality content | 22 |
| Most TV episodes | 24 |

### Audio

#### Track selection

* **Keep only the original language audio** associated with the title
  * Discard dubbed language tracks, "Audio Description", or Commentary tracks
* **Prefer passing through the original audio format** directly from the source, rather than converting to a different format
  * Keep only the first matching `DTS-HD`, `DTS`, or `AC3` track where available
    * `DTS-HD` is preferred when the audio quality is extra important
    * `DTS` core is acceptable for the majority of movies (significant file size savings compared to `DTS-HD`)
    * `AC3` is common from Blu-ray sources that otherwise use TrueHD as the primary track
  * If none of those formats are available, convert the highest-quality source track to `AAC`
    * Maintain the existing channel mix (e.g. if the source is 7.1, keep that)
    * Maximum bitrate: 512 kbps or the original track's value, whichever is lower (do not upscale)
  * Only for _exceptionally_ high-quality movies where a TrueHD track is available: it can be kept but must be secondary to a more compatible track following the above rules (i.e. keep or add a `DTS` or `AAC` track as the default)

#### Track naming
* Label tracks according to their channel availability, not their format:
  * e.g. `Surround 5.1` or `Stereo`, not `DTS Surround` or `AAC for Roku`

### Subtitles

#### Track selection

> [!NOTE]
> Prior to running Handbrake, use mkvExtractGUI to extract subtitles to identify which tracks contain what content.

* Keep only English subtitles
* Keep only subtitles for the actual content of the media
  * Discard Commentary subtitles (unless Commentary audio is kept for some reason)
  * Discard trivia popups or other non-dialogue tracks
* Check the "Default" checkbox for the primary subtitle track and ensure it is listed first in the track order
* Keep Forced Subtitle tracks when applicable
  * Since forced tracks are typically only a very small number of lines, consider converting to external `SRT` file instead
* Prefer SDH subtitles when available
  * If both SDH and non-SDH are available, keep only SDH
* Keep only image-based subtitles within the file
  * Text-based formats (`SRT` or `SSA`/`ASS`) should be extracted from the source file and stored alongside the output file
* Never burn subtitles into the video

#### Track naming

* Do not include language in the track name (e.g. do not name a track "English")
* SDH tracks should be named `SDH`
* Non-SDH tracks should not have a name
* Forced tracks should be named `Foreign Dialogue`
  * If the media's original language is not English, the subtitle track does not need to be labeled as Forced (e.g. a Japanese movie does not need the English subtitles marked "Forced")
