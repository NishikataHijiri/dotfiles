# Maintainer: hijiri

alias od='od -txlz -Ax -v'
alias grep='grep -E --color=auto'

alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

alias l='ll -aF'
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lx='ll -a'
alias lc='ll -c'
 
alias ...='cd ../../'
alias ....='cd ../../../'
 

alias vi='vim -u NONE'
alias python='python3'
alias g++='g++ --std=c++14'
alias llvm-g++='llvm-g++ --std=c++14'
alias clang++='clang++ --std=c++1y --stdlib=libc++'

alias htop='sudo htop'
alias _cleanup='sudo purge'



# zsh editor config
bindkey -e
autoload -U compinit promptinit

setopt auto_cd

setopt auto_pushd
setopt pushd_ignore_dups
#setopt extended_glob
setopt hist_ignore_all_dups


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

# Recompile
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

# setting for size of history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
PATH=${PATH}:~/bin

HISTTIMEFORMAT="[%M/%D/%Y %H:%M:%S]"

# Move key bind
zmodload zsh/complist
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

# Loading my settings
[ -f ~/.zsh.d/zshrc.mac ] && source ~/.zsh.d/zshrc.mac
[ -f ~/.zsh.d/zshrc.encoding ] && source ~/.zsh.d/zshrc.encoding
[ -f ~/.zsh.d/zshrc.completion ] && source ~/.zsh.d/zshrc.completion

# Load kvm
[ -s "/Users/hijiri/.k/kvm/kvm.sh" ] && . "/Users/hijiri/.k/kvm/kvm.sh" 
