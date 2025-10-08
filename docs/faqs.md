---
permalink: /faqs
---
# Frequently Asked Questions

### Q: What is Plex?

The simple version is that it's _my own personal Netflix._  
I have a significant collection of Blu-rays and DVDs which have been copied to my computer. Plex organizes that content and lets me watch it from anywhere.

### Q: Is Plex free?

Plex is a _completely free service._  
The host (me) obviously has to have a capable computer and storage space, and I paid for a Plex Pass to get some additional features, but otherwise Plex itself is free to use.  
**There is no charge to you for using my Plex.**

> **NOTE:** The company also offers <a href="https://watch.plex.tv/on-demand" target="_blank">their own ad-supported streaming content</a> — this is _completely separate_ from whatever might be hosted by individual server owners, but it's still free.

### Q: Do I need anything in order to use Plex?

All you need is a free Plex account and an internet-connected player device that can run the Plex app.  
I recommend something like an Apple TV, <a href="https://store.google.com/product/google_tv_streamer" target="_blank">Google TV Streamer</a>, or an <a href="https://www.amazon.com/dp/B0B75QMC7X" target="_blank">Onn Streaming Device</a>, but whatever you have is probably fine.

### Q: How does it work?

I have a computer ("Server") in my home holding files from my media collection.  
Plex runs on that server, gets information about the files (like titles, plot summaries, ratings, etc), and creates a streaming service from those libraries.  
This just means I can watch what I want, when I want, without having to be home to get a disc off a shelf.

The Plex app on any player device ("Client") understands that device's capabilities: what file formats it supports, what its internet connection looks like, etc.  
Plex delivers media to that device in a format it can handle.

🟢 If the Client is _100% compatible_ with the source file, it will just stream the file exactly as-is. This is called **Direct Play**.  
🟡 If the Client can't handle something, it will convert to something it _does_ support. This is called **Transcoding** — the Server has to re-create the content on-the-go in a format your player can handle, which may result in some buffering.

#### Common Reasons for Transcoding:
* Your player or TV doesn't have surround sound, so Plex will convert the surround audio to stereo.
* Your player doesn't support the encoding format of the audio or video, so Plex is transcoding to a format the Client can handle.
* Your player doesn't support the format of the subtitles, so Plex has to merge the subtitles directly into the video.
  * This may result in buffering, since it's working to create a new video on-the-fly.
* Your quality settings are set to something other than "Original", so Plex is converting to a lower-quality version.
* The network connection speed is not fast enough, so Plex is transcoding to a lower-bandwidth version.

Transcoding isn't _bad_ but obviously it's better if Plex can just play the original file without having to convert anything.


