#!/bin/bash

CURDIR=$(pwd)
cd $HOME/dotfiles

BACKUPFOLDER=$(date +backup-%d-%m-%yat%I-%M-%S);

mkdir $HOME/dotfiles/$BACKUPFOLDER;

# files that go in home
DIRS1=("bash" "aliases" "zsh" "X" "systemd" "compton" "dircolors")
# directories that go in ~/.config/
DIRS2=("i3" "i3status" "dunst" "rofi" "rofi-pass" "conky" "periscope" "mpv" "mpd" "ncmpcpp" "ranger" "git" "zathura")
# directories that go in home
DIRS3=("ssh" "vim" "gnupg")

# files that go in home
#{{{
for DIR in "${DIRS1[@]}"
do
    if [ ! -d "$DIR" ];then
        continue
    fi
    cd "$DIR"
    for FILE in .* 
    do
        if [ "$FILE" != ".." -a "$FILE" != "." ]; then
            if [ -h ~/$FILE ] || [ -e ~/$FILE ] ; then
                mv "$HOME/$FILE" "$HOME/dotfiles/$BACKUPFOLDER/"
            fi
            ln -s $HOME/dotfiles/$DIR/$FILE $HOME
        fi
    done
    cd ..
done
#}}}


# directories that go in ~/.config/
# {{{
mkdir -p $HOME/.config/
for DIR in "${DIRS2[@]}"
do
    if [ ! -d "$DIR" ];then
        continue
    fi
    mkdir -p "$HOME/.config/$DIR"
    cd $DIR
    for FILE in *
    do
        if [ -e $HOME/.config/$DIR/$FILE ] || [ -h $HOME/.config/$DIR/$FILE ]; then
            mv "$HOME/.config/$DIR/$FILE" $HOME/dotfiles/$BACKUPFOLDER
        fi
        ln -s "$HOME/dotfiles/$DIR/$FILE" "$HOME/.config/$DIR/"
    done
    cd ..
done
# }}}


# directories that go in home
# {{{
for DIR in "${DIRS3[@]}"
do
    if [ ! -d "$DIR" ];then
        continue
    fi
    mkdir -p "$HOME/.$DIR"
    cd $DIR
    for FILE in *
    do
        if [ -e $HOME/.$DIR/$FILE ] || [ -h $HOME/.$DIR/$FILE ]; then
            mv "$HOME/.$DIR/$FILE" $HOME/dotfiles/$BACKUPFOLDER
        fi
        ln -s "$HOME/dotfiles/$DIR/$FILE" "$HOME/.$DIR/"
    done
    cd ..
done
# }}}


# Deal with daemons
# {{{
unset answer
echo -n "Do you wish to initialize other daemons like mpd? [Y/n] "
read answer
if [ "$answer" == "Y" -o "$answer" == "y" -o -z "$answer" ] ; then
    if [ -x /usr/bin/mpd ] ; then
        systemctl enable --user mpd
    else
        echo "Waring: mpd not enabled because it isn't installed"
    fi
    [[ -a $HOME/.config/systemd/ ]] && mv $HOME/.config/systemd/ $HOME/dotfiles/$BACKUPFOLDER
    cd systemd/user/
    for FILE in *
    do
        systemctl --user enable $HOME/dotfiles/systemd/user/$FILE
    done
fi
# }}}


# Deal with vim plugins
#{{{
unset answer
echo -n "Do you wish to initialize vim plugins? [Y/n] "
read answer

if [ "$answer" == "Y" -o "$answer" == "y" -o -z "$answer" ] ; then
        vim +PlugUpgrade +qall
        vim +PlugInstall +qall
fi
#}}}

cd $CURDIR

# vim:foldmethod=marker:foldlevel=0
