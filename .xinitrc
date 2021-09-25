autorandr --load home
xrdb -merge ~/.Xresources
systemctl --user start picom.service
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
exec i3
