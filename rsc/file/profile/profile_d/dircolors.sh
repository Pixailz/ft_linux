# Setup for /bin/ls and /bin/grep to support color, the alias is in /etc/bashrc.
[ -f "/etc/dircolors" ] \
	&& eval $(dircolors -b /etc/dircolors)
[ -f "${HOME}/.dircolors" ] \
	&& eval $(dircolors -b ${HOME}/.dircolors)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
