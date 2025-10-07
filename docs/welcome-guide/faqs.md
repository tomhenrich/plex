# Frequently Asked Questions

### Q: What is Plex?

The simple version is that it's _my own personal Netflix._  
I have a significant collection of Blu-rays and DVDs which have been copied to my computer. Plex organizes that content and lets me watch it from anywhere.

### Q: Is Plex free?

Plex is a _completely free service._  
The host (me) obviously has to have a capable computer and storage space, and I paid for a Plex Pass which unlocks some additional features, but otherwise Plex itself is free to use.  
There is no charge to you for using my Plex.

> **NOTE**
> The company also offers [their own ad-supported streaming content](https://watch.plex.tv/on-demand) — this is _completely separate_ from whatever might be hosted by individual server owners, but it's still free.

### Q: Do I need anything to use Plex?

All you need is a free Plex account and an internet-connected player device that can run the Plex app.  
I recommend something like an Apple TV, [Google TV Streamer](https://store.google.com/product/google_tv_streamer), or an [Onn Streaming Device](https://www.amazon.com/dp/B0B75QMC7X), but whatever you have is probably fine.

### Q: How does it work?

The Plex app on any Client device understands the device's capabilities: what file formats are supported, what its internet connection looks like, etc. Plex will then deliver media to that device in a format it can handle.

🟢 If the Client is _100% compatible_ with every aspect of the source file, it will **Direct Play**, streaming the file exactly as-is.  
🟡 If the Client can't handle something, it will **Transcode** to something it _does_ support. This creates some work for the Server since it has to re-create the file on-the-fly, and may result in some buffering.

#### Common Reasons for Transcoding:
* Your player or TV doesn't have surround sound, so Plex will convert the surround audio to stereo.
* Your player doesn't support the encoding format of the audio or video, so Plex is transcoding to a format the Client can handle.
* Your player doesn't support the format of the subtitles, so Plex has to merge the subtitles directly into the video.
  * This may result in buffering, since it's working to create a new video on-the-fly.
* Your quality settings are set to something other than "Original", so Plex is converting to a lower-quality version.
* The network connection speed is not fast enough, so Plex is transcoding to a lower-bandwidth version.
