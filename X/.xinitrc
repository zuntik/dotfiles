
if [ -f $HOME/.Xresources ]; then
    xrdb -merge $HOME/.Xresources
fi

if [ -f $HOME/.Xmodmap ]; then
    xmodmap $HOME/.Xmodmap
fi
setxkbmap pt
setxkbmap -option caps:escape
# setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'
xset r rate 150 55

if [ -x /usr/bin/numlockx ]; then
      /usr/bin/numlockx on
fi

#export GTK_THEME=Arc firefox

exec i3

# vim: filetype=sh
