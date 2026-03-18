---
permalink: /faqs
---
# Frequently Asked Questions

### What is Plex?

The simple version is that it's _my own personal Netflix._  
I have a significant collection of Blu-rays and DVDs that I've copied to my computer. Plex organizes those files, collects metadata about them, and lets me watch from anywhere.  
This means I can watch what I want, when I want, without having to hope that my favorite movies are still available on some expensive streaming service.

### Is Plex free?

**There is no charge to you for using my Plex.**  
It's a hobby that I've put some money into, but it is a free service.

The company also offers <a href="https://watch.plex.tv/on-demand" target="_blank">their own ad-supported streaming content</a> and a handful of titles you can pay to rent. This is _completely separate_ from whatever might be available from someone's personal Plex server.

If you ever see "Available to Rent" or "Free On Demand", that's coming from their company, not from me.

### Do I need anything in order to use Plex?

All you need is a free Plex account and an internet-connected device that can run the Plex app.  
I recommend something like an Apple TV, <a href="https://store.google.com/product/google_tv_streamer" target="_blank">Google TV Streamer</a>, or an <a href="https://www.amazon.com/dp/B0B75QMC7X" target="_blank">Onn Streaming Device</a>, but whatever you have is probably fine.

### Do you have [specific movie]?

I regularly acquire new stuff to add to my Plex server. (I already said it was a hobby.) If there's something specific you want to see, let me know and I'll try to find it.

### How does it work?

I have a computer ("Server") with files from my media collection. Plex runs on that computer, gets information like titles, plot summaries, and trailers, and makes them available to stream.  

The Plex app on your player ("Client") understands that device's capabilities; my server then streams media to your device in a format it can handle, converting to new formats if needed.

🟢 If the Client is _100% compatible_ with the source file, it will just stream the file exactly as-is. This is called **Direct Play**.  
🟡 If the Client can't handle something, the Server will convert the file as needed. This is called **Transcoding** — the content has to be re-created in realtime in a format your player can handle, which may result in some buffering.

#### Common reasons for transcoding/buffering:
* Your quality settings are set to something other than "Original", so the Server is converting it to a lower-quality version.
* The network connection speed is not fast enough, so the Server is transcoding to a lower-bandwidth version.
* Your player doesn't support the format of the audio or video, so the Server is converting it to a format the Client _can_ handle.
* Your player doesn't support the format of the subtitles, so the Server has to merge the subtitles directly into the video.

Transcoding isn't _bad_, it just means your video might buffer occasionally while the Server catches up with re-creating the stream.

