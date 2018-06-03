HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch
unsetopt appendhistory autocd beep extendedglob notify

# Completion
# {{{

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:'    max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'

# don't complete backup files as executables
zstyle ':completion:*:complete:-command-::commands' ignored-patterns '(aptitude-*|*\~)'

# start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*'       insert-unambiguous true
zstyle ':completion:*:corrections'     format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*'       original true

# activate color-completion
zstyle ':completion:*:default'         list-colors ${(s.:.)LS_COLORS}

# format on completion
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'

# automatically complete 'cd -<tab>' and 'cd -<ctrl-d>' with menu
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# insert all expansions for expand completer
zstyle ':completion:*:expand:*'        tag-order all-expansions
zstyle ':completion:*:history-words'   list false

# activate menu
zstyle ':completion:*:history-words'   menu yes

# ignore duplicate entries
zstyle ':completion:*:history-words'   remove-all-dups yes
zstyle ':completion:*:history-words'   stop yes

# match uppercase from lowercase
zstyle ':completion:*'                 matcher-list 'm:{a-z}={A-Z}'

# separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''

# if there are more than 5 options allow selecting from a menu
zstyle ':completion:*'               menu select=5
 
zstyle ':completion:*:messages'        format '%d'
zstyle ':completion:*:options'         auto-description '%d'

# describe options in full
zstyle ':completion:*:options'         description 'yes'

# on processes completion complete all user processes
zstyle ':completion:*:processes'       command 'ps -au$USER'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# provide verbose completion information
zstyle ':completion:*'                 verbose true

# recent (as of Dec 2007) zsh versions are able to provide descriptions
# for commands (read: 1st word in the line) that it will list for the user
# to choose from. The following disables that, because it's not exactly fast.
zstyle ':completion:*:-command-:*:'    verbose false

# set format for warnings
zstyle ':completion:*:warnings'        format $'%{\e[0;31m%}No matches for:%{\e[0m%} %d'

# define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'

# Ignore completion functions for commands you don't have:
zstyle ':completion::(^approximate*):*:functions' ignored-patterns '_*'

# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'

# complete manual by their section
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin            \
                                           /usr/X11R6/bin

# provide .. as a completion
zstyle ':completion:*' special-dirs ..

setopt correct

# command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# }}}

autoload -Uz compinit
compinit

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then 
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Vim editor
export VISUAL="vim"
export EDITOR="vim"

# If this is an xterm set the title to user@host:dir
case $TERM in
    xterm*|rxvt*)
        # precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        precmd () {print -Pn "\e]0;%n@%m - $TERM\a"}
        ;;
esac

# My prompt
#PROMPT='[%F{red}%n@%M%F{white}] [%F{green}%T%F{white}] [%F{yellow}%~%F{white}] 
# %F{white}->%F{014} '
function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%}[% NORMAL]% %{$reset_color%}"
	PROMPT="[%F{red}%n@%M%F{white}] [%F{green}%T%F{white}] [%F{yellow}%~%F{white}] ${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/[INSERT]} $EPS1
 %F{white}-> %F{grey}"
    #PROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/[INSERT]} %? $EPS1"
    zle reset-prompt
}
#PROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} %? $EPS1"
PROMPT=$'[%F{red}%n@%M%F{white}] [%F{green}%T%F{white}] [%F{yellow}%~%F{white}] ${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/[INSERT]} %? $EPS1
 %F{white}->%F{014} %{\e[0m%}'
zle -N zle-line-init
zle -N zle-keymap-select


bindkey -v

bindkey '^R' history-incremental-search-backward

# Source aliases
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.aliases2 ]] && source ~/.aliases2

# Add bin to path
path+=($HOME'/bin')

[[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey '^L' clear-screen 

setopt autocd
# vim:foldmethod=marker:foldlevel=0
