xrdb -merge ~/.Xresources
feh --bg-scale --randomize ~/.wallpaper/*
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
