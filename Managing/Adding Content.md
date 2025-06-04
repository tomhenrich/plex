# Adding Content to Plex
All the steps in this guide assume you are logged into the computer hosting Plex. That computer has all the applicable software mentioned.

## Adding from Physical Discs

**Super-short overview:**
1. [Use MakeMKV to copy the movie off the disc](#copy-the-disc-with-makemkv) (usually takes 20-30 minutes to copy, assuming the disc can be read cleanly with no errors).
2. Use Handbrake to compress it to a smaller file (runs for a few hours depending on the settings).
3. Name the resulting file according to Plex’s naming conventions.
4. Move that folder & file to the appropriate location on the connected hard drive.
5. Run FreeFileSync to copy that to the NAS, then have Plex scan for new content.

### Copy the disc with MakeMKV
1. Insert the disc into the connected drive, then open MakeMKV. It should detect the disc automatically.
2. Click the button in the left-hand panel to open the disc and scan for available titles.
   * The existing settings will discard any content under 5 minutes long
3. You will be shown a list of content, in a tree structure with checkboxes.
   1. Right-click any option and select the menu option to "Deselect All". You'll manually select only the titles you want to keep.
   2. For many discs, the actual media content you want will be the largest file listed.
4. Optionally set your preferred file title and file name using the fields in the right-hand panel.
5. Click the "Make MKV" button and let it complete.

> [!NOTE]
> There is no 100% foolproof guaranteed way to identify the right track on every single disc ever. Sometimes a disc will have only a couple titles and it will be immediately obvious which is the right one.
>
> Sometimes a disc will appear to have dozens of identical titles — this is called "playlist obfuscation" and is specifically meant to make it difficult to rip physical media. There are some advanced methods to figure out which is correct, but require software I do not have.
> 1. Select the "Title" entry, then look for a "Source file name" value in the Info panel.
> 2. Many Blu-rays will have 0800.mpls as the "correct" file. Otherwise Google `makemkv [movie name] playlist` and see if others have figured it out.

> [!WARNING]
> If you get errors during the ripping process, check this thread on the MakeMKV forums: [If you're experiencing rip errors, please read here first!](https://forum.makemkv.com/forum/viewtopic.php?t=15055)
> MakeMKV requires a pristine disc. A disc with any kind of scratches, specks of dust, or just bad vibes can result in errors that will render it unrippable. It will likely still play in an actual Blu-ray player though.

## Adding from Online Sources
There are various sites that let you find torrent files or magnet links, which can be opened in a program like qBittorrent to download media. Doing so is not part of the scope of this document. 🏴‍☠️

## Helpful Links
* [MakeMKV Support](https://www.makemkv.com/onlinehelp/)
