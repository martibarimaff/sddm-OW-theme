# sddm-OW-theme

sddm-OW-theme is an Outer Wilds inspired sddm theme based on Eucalyptus Drop by Matt Jolly which is an enhanced fork of SDDM Sugar Candy by Marian Arlt. (credited in the `AUTHORS` file)

## DISCLAIMERS

This theme was primarily made for personal use and with minimal knowledge of the qml programming language. At some point i decided to make it public, so that some of my friends could use it, but be aware i didn't know what i was doing when working on this (i still don't btw) and some of the code is for sure poorly written and maybe redundant, but hopefully not broken.

It makes use a [custom font](https://github.com/martibarimaff/mbm-OW-Font) made by me which itself isn't finished, but is in a state that i find acceptable enough for this purpose. I plan to make an animated Outer Wilds wallpaper myself too, but for testing I'm using this: [reddit post](https://www.reddit.com/r/outerwilds/comments/14006n9/i_made_an_outer_wilds_animated_wallpaper/).

AI DISCLOSURE<br>
I did consult some LLMs to understand some of qtQuick classes and parameters because i find qml documentation online to be dispersive and non-comprehensive enough, at least for me.

## INSTALLING

### Dependencies

this theme is built using qt6 and a [custom font](https://github.com/martibarimaff/mbm-OW-Font) made by me.

### How to install a sddm theme

Download a release or clone the repository. You should put the theme folder (`sddm-OW-theme`) in `/usr/share/sddm/themes/`. Your path to main should look like this `/usr/share/sddm/themes/sddm-OW-theme/Main.qml`. 

Edit or create a `/etc/sddm.conf.d/theme.conf` file, that should contain these lines:
```
[Theme]
Current=sddm-OW-theme
```

Remember to disable your previous display manager and enable sddm if you are switching-

## LICENSING

For the most part this is a castrated version of Eucalyptus with some tweaks, and as such it is subject to the GPLv3 License (available for reading at `COPYING.md` and `LICENSE`).
