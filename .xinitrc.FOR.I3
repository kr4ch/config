#!/usr/bin/env bash
##xmodmap ~/.Xmodmap
xrdb -merge ~/.Xresources

export PATH=/home/tobias/.gem/ruby/2.5.0/bin:$PATH

eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)

# Add font directory
xset +fp /home/tobias/.local/share/fonts
xset fp rehash

# Testing for VSCode keyring auth issues (https://github.com/microsoft/vscode/issues/137850)
export $(dbus-launch)
# This will replace the daemon, required for VSCode auth:
gnome-keyring-daemon -r -d

exec i3
#dbus-run-session i3
#dbus-launch i3

