---
permalink: /faqs
---
# Frequently Asked Questions

### Q: What is Plex?

The simple version is that it's _my own personal Netflix._  
I have a significant collection of Blu-rays and DVDs which I've copied to my computer. Plex organizes them and lets me watch from anywhere.  
This means I can watch what I want, when I want, without having to get a movie off a shelf or hope that Netflix hasn't removed my favorite movies.

### Q: Is Plex free?

**There is no charge to you for using my Plex.**  
It's a hobby that I've put some money into, but it is a free service.

> **NOTE:** The company also offers <a href="https://watch.plex.tv/on-demand" target="_blank">their own ad-supported streaming content</a> and a handful of titles you can pay to rent — this is _completely separate_ from whatever might be hosted by individual server owners.

### Q: Do I need anything in order to use Plex?

All you need is a free Plex account and an internet-connected device that can run the Plex app.  
I recommend something like an Apple TV, <a href="https://store.google.com/product/google_tv_streamer" target="_blank">Google TV Streamer</a>, or an <a href="https://www.amazon.com/dp/B0B75QMC7X" target="_blank">Onn Streaming Device</a>, but whatever you have is probably fine.

### Q: How does it work?

I have a computer ("Server") with files from my media collection. Plex runs on that computer, gets information like titles, plot summaries, and trailers, and creates a streaming service to play them.  

The Plex app on your player device ("Client") understands that device's abilities: what files it supports, what its internet connection looks like, etc.  
Plex then streams media to that device in a format it can handle.

🟢 If the Client is _100% compatible_ with the source file, it will just stream the file exactly as-is. This is called **Direct Play**.  
🟡 If the Client can't handle something, the Server will convert the file to something the Client _does_ support. This is called **Transcoding** — the content has to be re-created in realtime in a format your player can handle, which may result in some buffering.

#### Common Reasons for Transcoding:
* Your player or TV doesn't have surround sound, so Plex will convert the surround audio to stereo.
* Your player doesn't support the encoding format of the audio or video, so the Server is transcoding to a format the Client can handle.
* Your player doesn't support the format of the subtitles, so the Server has to merge the subtitles directly into the video.
  * This may result in buffering, since it's working to create a new video on-the-fly.
* Your quality settings are set to something other than "Original", so the Server is converting it to a lower-quality version.
* The network connection speed is not fast enough, so the Server is transcoding to a lower-bandwidth version.

Transcoding isn't _bad_ but obviously it's better if Plex can just play the original file without having to convert anything.


