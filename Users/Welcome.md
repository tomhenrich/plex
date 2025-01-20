# Welcome to Plex

[Plex](https://www.plex.tv/) is a company that makes software for individuals to operate their own media server, letting you host your own media files and stream that media to devices. Think of it like Netflix, but run by an individual from their own home.

If you're reading this, you were probably invited to my server. Welcome.

## Ground Rules

My Plex server is hosted on a computer in my home, using my home internet, and has content I've personally added. As such:

* **It's not a replacement for other streaming subscriptions.**
  * I don't have the resources to acquire every movie ever made, but if there's something you'd like me to add, let me know and I'll do what I can to find it (within reason).
* **You're welcome to stream whatever you like, whenever you like.**
  * However, I don't have unlimited internet data, so I may limit access if I'm in danger of exceeding my monthly cap.
  * I do occasionally need to restart the computer for updates, but I try to make sure no one's using it at the time.
* **You may not share your account with others.**

An analogy I particularly like: **my server is like a backyard pool shared with friends.**
* You're welcome to use it whenever you like, just don't let in people I didn't invite.
* Sometimes it might be closed for maintenance or because it's over capacity.
* Yes, I can see if it's being used, but I'm not watching you use it.
* If there's something definitely *wrong* with it, please let me know!
* If you abuse your invite, you get uninvited.

## Getting Started

1. You'll receive an email from Plex directing you to **create an account** on their site.
2. Once you do that, **[install the Plex app](https://www.plex.tv/apps-devices/)** on your streaming device of choice and sign in.
   * Plex charges a one-time $5 activation fee on iOS and Android phones, but other streaming devices do not have this restriction.
3. **Set up your app** to remove their default services and pin my stuff to your navigation.
   * I recommend [following the guides on this site](https://mediaclients.wiki/en/Plex/Plex-Invite) for your device.
   * The steps are a little different for each device, but the idea is the same everywhere.
4. I *strongly* encourage you to **[update the quality settings](https://mediaclients.wiki/en/Plex#streaming-clients) for your device**.
   * The default settings in Plex apps will result in lower-quality streams and a bad experience for everyone involved.

## Actually Using Plex

Plex is organized into **Libraries** that contain either Movies or TV Shows. The **Home Screen** will show what has recently been added to the Server, what titles are recently added, and any titles you're in the middle of watching.

You can go into a specific Library to browse for something to watch, or search for something specific. Movies that are part of a series (e.g. all the James Bond movies) are usually grouped into Collections. I have my Plex set to put any franchise of 2 or more movies into a Collection, plus I have a few custom collections like "movies based on Stephen King books".

Once you decide on something to watch, just click Play. At any time, you can change your playback settings like subtitles or quality.

**A note on subtitles:**
* "SDH" ("Subtitled for Deaf and Hard of hearing") means they also contain effects (like `[music playing]`).
* "Forced" means they only contain foreign-language dialogue, like if someone speaks a few lines of French in an otherwise English-language movie.

-----

## If you're curious: "How does it work?"

The simple version is: I have a computer at my home, connected to hard drives with media files. Plex organizes those files, collects metadata about them (movie titles, plot summaries, audience ratings, etc), and streams them to devices ("Clients").

The company also offers their own on-demand streaming content, though this is completely separate from whatever might be hosted by individual server owners. (Despite it showing up in the Plex app looking like it's all the same.)

Without getting super technical, [how well any given piece of media plays](https://support.plex.tv/articles/200430303-streaming-overview/) through Plex depends on a few things: the file format itself, the encoding of the video and audio, the format of the subtitles, the quality settings used, and the internet speed of both the Client and the Server.

🟢 If the Client is 100% compatible with every aspect of the source file, it will **Direct Play.** This needs almost no processing power from the Plex server. This is the ideal scenario.

🟡 If the Client is *mostly* compatible but needs to change the container, it will **Direct Stream.** This requires *some* processing power but not much.

🟠 If the Client doesn't support something, it will **Transcode** the file on-the-fly to a supported format. This is harder on the server, but it depends on what parts of the file are being converted.

My home internet only goes up to ~12 Mbps upload speed at best, so remote streaming has a capped quality level. If the source file has a higher bitrate, it will transcode to a lower supported bitrate. This *may* cause some buffering.
