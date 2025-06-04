# How Plex Works

The simple version is: I have a computer at my home that stores media files for movies and TV shows (the "Server"). Plex organizes those files, collects information about them (titles, plot summaries, audience ratings, etc), and streams them to players (called **"Clients"**).

> [!NOTE]
> The company also offers [their own on-demand streaming content](https://watch.plex.tv/on-demand) — this is _completely separate_ from whatever might be hosted by individual server owners.

## Playback
[How well content plays through Plex](https://support.plex.tv/articles/200430303-streaming-overview/) depends on a few things: the quality settings used by the Client, the internet speed of both the Client and the Server, the format of the video and audio in each file, and the format of any subtitles being used.

The Plex app on any Client device understands the device's capabilities: what kinds of audio and video are supported, what the device's network connectivity looks like, etc. Plex will then deliver media to that device in a format it can handle.

🟢 If the Client is _100% compatible_ with every aspect of the source file, it will **Direct Play**, just streaming the file exactly as-is.

🟡 If the Client is _mostly compatible_ but just needs a different file type, it will **Direct Stream.**

🟠 If the Client can't handle something, it will **Transcode** the file to something it _does_ support. This creates some work for the Server since it has to re-create the file on-the-fly, and may result in some buffering.

> [!NOTE]
> This is why it's important to [update the quality settings](https://mediaclients.wiki/en/Plex#streaming-clients) for your device — so Plex doesn't have to send you a low-quality transcoded video.

### Common Reasons for Transcoding:
* Your setup doesn't support surround sound, so Plex is transcoding the audio to a stereo mix.
  * If you're using a streaming device plugged into a TV (like a Roku or Fire Stick), it will also depend on what your TV tells the device it can handle.
* Your Client doesn't support the encoding format of the audio or video, so Plex is transcoding to a format the Client can handle.
* Your Client doesn't support image-based subtitles[^1], so Plex has to merge the video and the subtitles together.
  * This is the most resource-intensive task the Server has to deal with and may result in buffering.
* Your quality settings are set to something other than "Original", so Plex is transcoding to a lower-quality version.
* The network connection speed is not fast enough, so Plex is transcoding to a lower-bandwidth version.
  * Think of it like pushing a ball through a pipe – if the ball is too big for the pipe, you need to squish it down to fit.


### Factors Plex Considers:

* **File format compatibility** on the player ("Client")
  * This is the actual file type (like how JPG and PNG are different). For media files it's called a Container because it _contains_ the media tracks.
* **Video codec**
  * [Codec](https://en.wikipedia.org/wiki/Video_codec) defines how the video is encoded and compressed.
  * Most of my files are x265 (aka HEVC) or x264. x264 is widely supported, but x265 is more efficient (better quality at lower file size), so I've been updating my files where possible.
* **Audio codec and mix**
  * Audio tracks are usually one of these formats: DTS, AAC, AC3, or EAC3; these are fairly well-supported. They may also be in a surround sound format (6 or 8 channels including a subwoofer) or in stereo (2 channels, left and right).
  * Super high-fidelity tracks like TrueHD or Atmos are not well-supported by most Clients, so it is only available on super-high-quality media and even then only as a secondary option after a better-supported format.
* **Subtitle type**
  * Subtitles are either text-based (SRT or SSA/ASS) or image-based[^1].
  * Text subtitles are very widely supported. Image subtitles are less so, but Plex should still handle them relatively easily.
* **Bitrate/quality**
  * The higher the bitrate, the higher the quality. This is mostly irrelevant within the same home network as the Server, but may cause issues if attempting to play remotely.
 

[^1]: Physical Blu-rays and DVDs, and files directly copied from them, use subtitles that are just pictures of words which get overlaid on the video.
  These are usually called "PGS" or "Vobsub" when shown in Plex.
