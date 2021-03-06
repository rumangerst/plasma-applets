[b]v14 - September 7 2016[/b]

* Show current song in tooltip.
* Use description instead of the internal name on mics/speakers.
* Use the video-television icon for the hdmi speaker.

[b]v13 - August 26 2016[/b]

* Add media controls based on the default widget + mediacontrollercompact. You can disable it in the settings.
* Icons now follow the theme color.

[b]v12 - August 24 2016[/b]

* Use heaphones icon when port is set to Headphones.
* Add context menu to quickly: Change the default speaker/microphone, Volume Boost the steam, Change the port (eg: headphones).
* Mute button now mutes instead of volume boosts.
* Fix drag and drop device selection.
* Show output device id in app tooltip.
* Add group for "Recording Apps" (eg: VirtualBox).
* Add standard pin to keep mixer open.
* Optionally move all app streams to the newly selected default device.

[b]v11 - July 7 2016[/b]

* This requires KDE 5.7+
* Bump version ahead of the AUR package which bumped versions before I started versioning.
* Merged from upstream (plasma-pa):
  * Use the default speaker volume in the panel icon.
  * Media keys only control the default speaker.
  * Volume Boost to 150%. Can be toggled per app by clicking the speaker icon (formerly the mute button). I will be moving that button to a context menu as soon as I figure out how. Example: https://streamable.com/oqt4
  * Don't disable the slider when muted, alowing the user to change the volume without unmuting.
  * Handle Microphone shortcuts.

[b]v2 - May 13 2016[/b]

* Supports KDE 5.5 and KDE 5.6 (Maybe 5.4?)
* Custom vertical volume slider.
* Configurable number of steps to reach 100% volume with media keys.
* Add links to alsamixer and pavucontrol in context menu.
* Merged from upstram (plasma-pa):
  * Drag and drop to move app output to a specific speaker.

[b]v1 - ?[/b]
* Vertical volume sliders.
