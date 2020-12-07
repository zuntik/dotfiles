if ! foobar_loc="$(type -p "antibody")" || [[ -z $foobar_loc ]]; then
	antibody bundle < ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zsh_plugins.txt > ${XDG_CONFIG_HOME:-$HOME/.config}/zsh/.zsh_plugins.sh 
fi
