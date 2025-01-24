# Overview of Plex

**Plex Media Server is a way to organize and stream media files** from a computer at home to an app on a TV or phone.

The [Plex Support site](https://support.plex.tv/articles/) has a ton of information.

## Playback Experience
How well any given piece of media plays through Plex [depends on a few things](https://support.plex.tv/articles/200430303-streaming-overview/).

The Plex app on any Client device understands the device's capabilities: what kinds of audio and video are supported, what the device's network connectivity looks like, etc. Plex will then deliver media to that device in a format it can handle

* **File format compatibility** on the player ("Client")
  * This is also referred to as the _container_.
  * Almost all my content is are MKV format since it allows for more and better metadata like chapter markers, embedded subtitles, etc. Some TV episodes may be in MP4 containers.
  * Plex can easily convert to a different container type if a Client device doesn’t understand MKVs.
* **Video codec**
  * [Codec](https://en.wikipedia.org/wiki/Video_codec) defines how the video is compressed. Most of my files are either H264 or the newer H265 (aka HEVC).
  * H264 is more widely supported, but H265 is more efficient (better quality at lower file size), so I've been updating/re-encoding content where possible.
  * All 4K content uses H265.
* **Audio codec**
  * Audio tracks are usually one of these formats: DTS, AC3, EAC3, or AAC; these are fairly well-supported.
  * Super high-fidelity tracks like TrueHD or Atmos are not well-supported by client devices. I typically only keep these tracks for 4K content.
* **Subtitle type**
  * Subtitles are either text-based (SRT or SSA/ASS) or image-based (PGS for Blu-rays or VOBSUB for DVDs, literally pictures of text which get overlaid on the video).
  * Text subtitles are very widely supported. Image subtitles are less so, but Plex should still handle them relatively easily.
* **Bitrate/quality**
  * The higher the bitrate, the higher the quality. This is mostly irrelevant on the home network, but may cause issues if attempting to play over the internet with a capped connection speed.
 
### Direct Play vs Direct Stream vs Transcoding
🟢 If the client is 100% compatible with the media being requested and has enough bandwidth, it will **Direct Play**. This is literally just sending the file from the server to the Client as-is, and requires basically zero server power.

🟡 If the client is _mostly_ compatible but needs to change the audio or video container, it will **Direct Stream**. This requires a tiny bit of work from the server but not much.

🟠 If the client doesn’t support the video, audio, or subtitles, or needs a smaller/lower quality file, it will **Transcode** to a supported format.
* This requires more CPU resources, but how much depends on what is being converted.
* Audio transcoding requires fairly little processing. Video transcoding takes more effort, but the Plex software is getting better at doing this.
* If the client doesn’t support image-based subtitles, they have to be “burned in”.
* If the bitrate of the video is too high for the internet connection’s bandwidth, it will transcode to a lower bitrate.
  * Typically, the higher the video quality, the higher the bitrate.
  * The bitrate of a streaming video will fluctuate as it buffers ahead.
  * Remote streaming (playing from anywhere other than our home network) is capped to a bitrate slightly below our overall upload speed. If you try to play a higher-bitrate file remotely, it will transcode the file down to a lower bitrate.
  * The PC hosting Plex should support an indefinite number of Direct Play video streams, and should theoretically be capable of 4-6 simultaneous transcodes.
  * Remote streaming eats data and we do not currently have an unlimited data plan.

## Plex Libraries
Plex is intended mainly for two types of content: movies and TV shows. These are organized into [Libraries](https://support.plex.tv/articles/200288916-overview/).

A Library can contain only one of those two types – you can’t mix them. They point to folders that must contain only that kind of content, since Plex uses specific services with information about either movies or TV shows.

Plex has specific naming conventions that must be followed in order for it to correctly identify and retrieve information about those files.
* [Naming and organizing movie files](https://support.plex.tv/articles/categories/your-media/naming-your-movie-media-files/)
* [Naming and organizing TV files](https://support.plex.tv/articles/categories/your-media/naming-and-organizing-tv-shows/)


