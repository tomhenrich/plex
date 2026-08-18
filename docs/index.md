---
title: Getting Started with Plex
description: How to sign up, get into Plex, and connect to shared libraries.
nav_order: 1
---
<a href="https://www.plex.tv/" target="_blank">Plex</a> lets me store my collection of movies and TV shows on a computer at home and play that content from anywhere, like a personal Netflix.

## Quickstart

1. **Accept the invitation:**  
   From the invitation email, **create a free account** or sign into your Plex account if you have one.
2. **Get the Plex app:**  
   Install the app on your streaming device(s) of choice and sign in.

✔️ You're in! You can start looking for something to watch.

_Technically optional but important:_

3. **Update the quality settings:** ⚙️  
   In the Settings, look for "Quality" or "Video" and [set it to "Original" or "Maximum"](quality-settings.md).  
   Otherwise you'll get low-resolution video and/or buffering.
4. **Pin my server** for quick access: 📌  
   This varies by device, but basically: open the navigation, select "More", and and pin `Movies` and `TV Shows` under `Scylla`[^pinning].

## Important notes

* **Using my Plex is always 100% free to you.**  
  Note that _Plex the company_ also has ad-supported content and rentals.[^ads]
* **Don't share your account.**  
  Let me know if you think someone would like an invitation, but don't just share your password.
* Users can have up to **two (2) streams at a time**.
  You can sign in on as many devices as you want, but only two can be streaming at once.
* If there's something you'd like to see, let me know!  

Feel free to ask if you need help or have questions.

## Using Plex

It's just like Netflix or other streaming services you've used.

From the side nav, pick `Movies` or `TV Shows` to browse, or use Search.  
Search may include results both from my server and from Plex's ad-supported streaming service. Titles on my server will show `Scylla`.

If it's available, **just click Play**.  
You can change audio or subtitle settings at any time.[^settings]

As with every streaming service, **Plex uses your internet.**  
If you have unlimited data like me, go nuts. If you have a monthly cap, just be mindful.

## Frequently Asked Questions

<details>

<summary>Is Plex free?</summary>

**There is no charge to you for using my Plex.**  
It's a hobby I've put some money into, but it is 100% free for you to use.

The company that makes the software also has <a href="https://watch.plex.tv/on-demand" target="_blank">their own ad-supported streaming content</a> and a handful of titles you can pay to rent. This is _completely separate_ from whatever might be available from someone's personal Plex server.

If you see "Available to Rent" or "Free On Demand", or if you ever see ads, that's coming from their company, not from me.

</details>
<details>

<summary>Do I need anything in order to use Plex?</summary>

All you need is a free Plex account and an internet-connected device that can run the Plex app.

You can watch on your phone or tablet anywhere you have Wi-Fi.  
You can even use <a href="https://support.plex.tv/articles/chromecast-airplay-and-casting/" target="_blank">Chromecast</a> from your iPhone or iPad to devices that allow it.

</details>
<details>

<summary>Do you have [specific movie]?</summary>

I regularly acquire new stuff to add to my Plex server. (I already said it was a hobby.) If there's something specific you want to see, let me know and I'll try to find it.

</details>
<details>

<summary>How does it work?</summary>

I have a computer ("Server") with files from my media collection. Plex scans that content, gets information like titles, plot summaries, and trailers, and makes it all available to stream.  

The Plex app on your player ("Client") understands that device's capabilities; my server then streams media to your device.

🟢 If the Client can handle the source file exactly as is, it will just stream the file directly to you. This is called **Direct Play**.  
🟡 If the Client can't handle something, the Server will convert the stream as needed. This is called **Transcoding** — the content has to be modified in realtime, which may result in some buffering.

#### Common reasons for transcoding/buffering:
* Your quality settings are set to something other than "Original", so the Server is converting it to a lower-quality version.
* The network connection speed is not fast enough, so the Server is transcoding to a lower-bandwidth version.
* Your player doesn't support the format of the audio or video, so the Server is converting it to a format the Client can handle.
* Your player doesn't support the format of the subtitles, so the Server has to merge the subtitles directly into the video.

Transcoding isn't _bad_, it just means your video might buffer occasionally while the Server catches up with re-creating the stream.

</details>

---

[^ads]: If you ever see ads, you're watching something from Plex's own ad-supported service. You will _never_ see ads watching anything from my server.

[^settings]: You can [update your account settings](account-settings) online to enable subtitles without having to select them every time you start watching.

[^pinning]: Plex has a support article explaining how to <a href="https://support.plex.tv/articles/customizing-the-apps/#toc-0" target="_blank">pin libraries</a> as favorite sources.
