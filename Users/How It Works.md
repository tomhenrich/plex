# How Plex Works

The simple version is: I have a computer at my home, connected to hard drives with media files. Plex organizes those files, collects information about them (titles, plot summaries, audience ratings, etc), and streams them to devices (called "Clients").

The company also offers [their own on-demand streaming content](https://watch.plex.tv/on-demand) – though this is _completely separate_ from whatever might be hosted by individual server owners.

## Playback
Without getting super technical, [how well content plays](https://support.plex.tv/articles/200430303-streaming-overview/) through Plex depends on a few things: the file format itself, the encoding of the video and audio, the format of the subtitles, the quality settings used, and the internet speed of both the Client and the Server.

🟢 If the Client is 100% compatible with every aspect of the source file, it will **Direct Play**, just sending the file directly to the Client as-is.

🟡 If the Client is _mostly_ compatible but just needs to change the file type, it will **Direct Stream.** This is basically the same thing, just copying the media stream into a new container.

🟠 If the Client can't handle something, it will **Transcode** the file to a format it _does_ support. This creates some work for the Server since it has to re-create the file on-the-fly, and may result in some buffering.

**Common reasons for transcoding:**
* If your setup doesn't support 5.1 surround sound, the Server can transcode the audio to a stereo mix.
  * If you're using a streaming device plugged into a TV (like a Roku or Chromecast), it will also depend on what your TV tells the device it can handle.
* If your setup doesn't support the encoding format of the audio or video, the Server will transcode to a format the Client can handle.
* If your setup doesn't support image-based subtitles[^1], the Server has to create a new stream that merges the video and the subtitles together.
  * This is probably the most resource-intensive task the Server has to deal with.
* The network connection speed is not enough to play the original video or audio.
  * The video or audio might have a bitrate (quality level) that is too high for the connection between your device and my Server – either your download speed or my upload speed.
  * Think of it like pushing a ball through a pipe – if the ball is too big for the pipe, you need to squish it down to fit.

This is also why it's important to update the quality settings for your device, so that Plex doesn't have to send you a low-quality transcoded video.

[^1]: Physical Blu-rays and DVDs, and files directly copied from them, use subtitles that are just pictures of words which get overlaid on the video.
  These are usually called "PGS" or "Vobsub" when shown in Plex.
