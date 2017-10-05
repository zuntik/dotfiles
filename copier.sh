 #!/bin/bas2

CURDIR=$(pwd)
cd $HOME/dotfiles

BACKUPFOLDER=$(date +backup-%d-%m-%yat%I-%M-%S);

mkdir $HOME/dotfiles/$BACKUPFOLDER;

# files that go in home
DIRS1=("bash" "aliases" "zsh" "X" "git" "systemd" "compton" "yaourt")
# directories that go in ~/.config/
DIRS2=("i3" "i3status" "dunst" "rofi" "rofi-pass" "conky")
# directories that go in home
DIRS3=("ssh" "vim" "gnupg")

for DIR in "${DIRS1[@]}"
do
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

mkdir -p $HOME/.config/
for DIR in "${DIRS2[@]}"
do
    if [ -d $HOME/.config/$DIR ] || [ -h $HOME/.config/$DIR ]; then
        mv $HOME/.config/$DIR $HOME/dotfiles/$BACKUPFOLDER/
    fi
    ln -s $HOME/dotfiles/$DIR $HOME/.config/
done

for DIR in "${DIRS3[@]}"
do
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

[[ -a $HOME/.config/systemd/ ]] && mv $HOME/.config/systemd/ $HOME/dotfiles/$BACKUPFOLDER
cd systemd/user/
for FILE in *
do
    systemctl --user enable $HOME/dotfiles/systemd/user/$FILE
done

# Deal with vim plugins

unset answer
echo -n "Do you wish to initialize vim plugins? [Y/n] "
read answer

if [ "$answer" == "Y" -o "$answer" == "y" -o -z "$answer" ] ; then
        vim +PlugUpgrade +qall
        vim +PlugInstall +qall
else
    echo "nothing else to be done"
fi

cd $CURDIR
