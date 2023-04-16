export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export SSH_AUTH_SOCK

autorandr --load home
xrdb -merge ~/.Xresources
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
eval $(ssh-agent)
xset r rate 150 30
exec i3
