
if [ -f $HOME/.Xresources ]; then
    xrdb -merge $HOME/.Xresources
fi

if [ -f $HOME/.Xmodmap ]; then
    xmodmap $HOME/.Xmodmap
fi

if [ -f $HOME/.xprofile ]; then
    source $HOME/.xprofile 
fi

function i3 {
	exec i3
}

session=${1:-i3}
case $session in
    i3|i3wm           ) exec i3;;
    kde               ) exec startkde;;
    xfce|xfce4        ) exec startxfce4;;
    # No known session, try to run it as command
    *                 ) exec $1;;
esac


# vim: filetype=sh
