# Maintainer: hijiri
# Last Modified: 2015-01-07T20:37:21

alias od='od -txlz -Ax -v'
alias grep='grep -E --color=auto'

alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lx='ll -a'

alias _clearcaches='sudo purge'
alias python='python3'

# Last Modified: 2015-01-07T20:47:53
# .zshrc config
bindkey -e

autoload -U compinit promptinit

setopt auto_cd

alias ...='cd ../../'
alias ....='cd ../../../'

setopt auto_pushd
setopt pushd_ignore_dups
setopt extended_glob
setopt hist_ignore_all_dups

zstyle ':completion:*:default' menu select=1

# This config link online help
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help


fpath=(/usr/local/share/zsh-completions $fpath)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# My Zshell design
autoload colors
colors
PROMPT="%{${fg[blue]}%}%m: %n%(!.#.%% )%{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[green]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%./]%{${reset_color}%}"
