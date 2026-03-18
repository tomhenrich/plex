# Handbrake Encoding Preferences

## Goals

1. Maximize quality while maintaining reasonable file sizes
2. Adjust quality by content type (e.g., rom-coms/comedies can be encoded at lower quality than action/sci-fi)
3. Avoid tying up the CPU for longer than necessary

**Sanity check:**
* Target an output file size of ~3-8 Gb per hour of content

### Assumptions

* Always encoding from a direct remux (copied from Blu-ray or DVD); never encoding from a 4K source
* x265/HEVC is widely supported enough to be used as the default codec
* Primary Plex client devices (iOS, Google TV, Roku) support x265 video and DTS audio; Plex server can transcode as needed otherwise

## Default Selection Preferences

### Format and dimensions

* Output to MKV format
* Do not crop or upscale video – maintain original dimensions and aspect ratio

### Video

| Content Type | Codec | RF/Quality | Notes |
| :----------- | :---- | :--------- | :---- |
| High visual impact (action, sci-fi) | x265 10-bit | 18 | Preserve detail, avoid banding |
| **Default** (drama, general films) | x265 10-bit | 20 | Balanced |
| Dialogue-heavy (rom-com, comedy) | x265 10-bit | 22 | Lower motion/detail |
| Animation | x265 10-bit | 22 | Compresses efficiently; set `Animation` profile |
| Older / low-quality | x265 10-bit | 24 |  |
| Grain-heavy film | x264 | 20 | Set `Grain` profile |

* Encoder Preset: `Medium` (typically takes 2-3 hours for an average movie)
  * `Slow` can produce better results but usually takes 8+ hours to complete an average movie

### Audio

#### Track selection

* **Keep only the original language audio**
  * Discard dubbed language tracks, "Audio Description", and Commentary
* **Keep exactly one primary audio track**
  * Keep only the first matching `DTS-HD`, `DTS`, or `AC3` track
    * `DTS-HD` is preferred for content where the sound quality is paramount
    * `DTS` or `AC3` is acceptable for the majority of titles
  * If none of those formats are available, convert the highest-quality source track to `AAC` for compatibility
    * Maintain the existing channel mix (e.g. if the source is 7.1, keep that)
    * Maximum bitrate: 512 kbps or the original track's value, whichever is lower (do not upscale)
  * TrueHD track may be kept for _exceptionally_ high-quality movies but must be secondary to a more compatible track

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
