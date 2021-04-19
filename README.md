bewm - Aditya's fork of dwm
============================
bewm is an extremely fast, small, and dynamic window manager for X.


Requirements
------------
In order to build bewm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (bewm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install bewm (if
necessary as root):

    make clean install


Running bewm
-----------
Add the following line to your .xinitrc to start bewm using startx:

    exec bewm

In order to connect bewm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec bewm

(This will start bewm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec bewm


Configuration
-------------
The configuration of bewm is done by creating a custom config.h
and (re)compiling the source code.


Modifications from stock dwm
---
## Patches that need to be merged:
- [fullscreen](https://dwm.suckless.org/patches/actualfullscreen/)
- [flextile](https://dwm.suckless.org/patches/flextile/)
- [taggrid](https://dwm.suckless.org/patches/taggrid/)
- [xresources](https://dwm.suckless.org/patches/xresources/)
- [restartsig](https://dwm.suckless.org/patches/restartsig/)
- [keymodes](https://dwm.suckless.org/patches/keymodes/) Apply flextiles patch
first

## My own modifications:
- [ ] custom keybinding handler, which does different things based on the state
of the active window. Useful for mapping same keys to behave differently based
on the state of the window.
