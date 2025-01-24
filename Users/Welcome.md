# Welcome to Plex

[Plex](https://www.plex.tv/) is a company that makes software letting you host media files and stream that content to devices. Think of it like Netflix, but run by an individual from their own home.

If you're reading this, you were probably invited to my server. Welcome!

## Basic Rules
My Plex server is running from a computer in my home, using my home internet, and has content I've personally added. As such:

* **It's probably not a replacement for your other streaming subscriptions.**
  * I don't have the resources to acquire every movie ever made, but if there's something you'd like me to add, let me know and I'll do what I can to find it (within reason).
* **I cannot 100% guarantee 24/7 availability.**
  * I don't have unlimited internet data, so external access may be limited temporarily if I'm in danger of exceeding my monthly data cap. _(Once I successfully upgrade to unlimited data this will not be a concern.)_
  * The computer does occasionally need to be restarted for updates, but I try to make sure no one's using it at the time.
* **You may not share your account with others.**

An analogy I particularly like: **my server is like a backyard pool shared with friends.**
* You're welcome to use it whenever you like, just don't let in people I didn't invite.
* Sometimes it might be closed for maintenance or because it's over capacity.
* Yes, I can see if it's being used, but I'm not watching you use it.
* If you continually abuse your access, you don't get to use it anymore.

## Getting Started
1. From the invitation email you received, click the link to **create an account** on the Plex website.

2. **[Install the Plex app](https://www.plex.tv/apps-devices/)** on your streaming device of choice and sign in.
   * Plex charges a one-time $5 activation fee on iOS and Android phones, but other devices do not have this restriction.

3. **[Set up your app](https://mediaclients.wiki/en/Plex/Plex-Invite)** to remove their default services and pin my stuff to your navigation.
   * The steps are a little different for each device, but the idea is the same everywhere.

4. **[Update the quality settings](https://mediaclients.wiki/en/Plex#streaming-clients)** in your app.
   * The default settings in Plex apps are not good and will result in a low-quality experience.

## Actually Using Plex
The **Home Screen** will show what has recently been added to the Server and any titles you're in the middle of watching.

Plex is organized into **Libraries** that can contain either Movies or TV Shows. You can go into a specific Library to browse, or you can use search.

Movies that are part of a series (e.g. all the James Bond movies) are usually grouped into Collections. My Server is set up so any franchise of 2 or more movies goes into a Collection, plus I have some custom collections like "movies based on Stephen King books" or "Chocolate Factory".

Once you decide on something to watch, just click Play. At any time before or during playback, you can change your settings like selecting subtitles, switching audio tracks, or adjusting quality or playback speed.

**A note on subtitles:**
* Subtitles labeled "SDH" ("Subtitled for Deaf and Hard of hearing") means they also contain effects (like `[music playing]`).
* Subtitles labeled "Forced" means they _only_ contain foreign-language dialogue, like if someone speaks a few lines of French in an otherwise English-language movie.

That's it!

-----

> [!NOTE]
> From here down is 100% optional reading, just if you're curious about how it works.

-----

## How It Works

The simple version is: I have a computer at my home, connected to hard drives with media files. Plex organizes those files, collects information about them (titles, plot summaries, audience ratings, etc), and streams them to devices (called "Clients").

The company also offers [their own on-demand streaming content](https://watch.plex.tv/on-demand) – though this is _completely separate_ from whatever might be hosted by individual server owners.

### Playback
Without getting super technical, [how well content plays](https://support.plex.tv/articles/200430303-streaming-overview/) through Plex depends on a few things: the file format itself, the encoding of the video and audio, the format of the subtitles, the quality settings used, and the internet speed of both the Client and the Server.

🟢 If the Client is 100% compatible with every aspect of the source file, it will **Direct Play**, just sending the file directly to the Client as-is.

🟡 If the Client is _mostly_ compatible but just needs to change the file type, it will **Direct Stream.** This is basically the same thing, just copying the media stream into a new container.

🟠 If the Client can't handle something, it will **Transcode** the file to a format it _does_ support. This creates some work for the Server since it has to re-create the file on-the-fly, and may result in some buffering.

**Common reasons for transcoding:**
* If your device doesn't support 5.1 audio, the Server can transcode the audio to a stereo mix.
  * If you're using a streaming device like a Roku plugged into a TV, it will also depend on what your TV tells the device it can handle.
* If your device doesn't support the encoding format of the video, the Server will transcode to a format the Client can handle.
* If your device doesn't support image-based subtitles[^1], the Server has to create a new stream that merges the video and the subtitles together.
  * This is probably the most resource-intensive task the Server has to deal with.
* The network connection speed is not enough to play the original video or audio.
  * The video or audio might have a bitrate (quality level) that is too high for the connection between your device and my Server – either your download speed or my upload speed.
  * Think of it like pushing a ball through a pipe – if the ball is too big for the pipe, you need to squish it down to fit.

[^1]: Physical Blu-rays and DVDs, and files directly copied from them, use subtitles that are just pictures of words which get overlaid on the video. These are usually called "PGS" or "Vobsub" when shown in Plex.
