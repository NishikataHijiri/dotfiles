###
#   Maintainer: alicengh
#   Last modified: 10-26-15
###

##############################
# Preferences
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# zsh editor config
bindkey -v #vim-mode
# bindkey -M viins 'jj' vi-cmd-mode

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

# Go Lang.
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=$HOME/.code/go-local
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi 
# export PATH=$PATH:/usr/local/opt/go/libexec/bin



##############################
# Aliases
alias od='od -txlz -Ax -v'
alias grep='grep -E --color=auto'

alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'

# alias l='ls -lF | grep /;ls -lF | grep -v / | tail +2'
alias l='ls -AF'
alias ll='ls -l'
alias la='ls -a'
alias lx='ll -a'

alias mkdir='mkdir -p'
 
alias ...='cd ../../'
alias ....='cd ../../../'
 

# Applications
alias vi='vim -u NONE'
alias python='python3'
alias Glan='glances'
alias g++='g++ --std=c++14'
alias llvm-g++='llvm-g++ --std=c++14'
alias clang++='clang++ --std=c++1y --stdlib=libc++'

# alias htop='sudo htop'
alias _cleanup='sudo purge'


# Enable alias after 'sudo' command
alias sudo='sudo '

# Global Aliases
alias -g L='| less'
alias -g G='| grep'


###
#   Copy of stdout to clip-board
###
if [ which pbcopy > /dev/null 2>&1 ]; then
    # Mac
    alias -g C='| pbcopy'
elif [ which xsel > /dev/null 2>&1 ]; then
    # Linux
    alias -g C='| xsel --input --clipboard'
fi



###
#   Other Operating Systems
###
case ${OSTYPE} in
    darwin*)
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        alias ls='ls -F --color=auto'
        ;;
esac

###
#   Apple Swift Development
###
export OSX_SDK=$(xcrun --show-sdk-path --sdk macosx)

PATH="/Users/hijiri/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/Users/hijiri/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/hijiri/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/hijiri/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/hijiri/perl5"; export PERL_MM_OPT;

###
#   Perl Env.
###
if which plenv > /dev/null; then eval "$(plenv init - zsh)"; fi
