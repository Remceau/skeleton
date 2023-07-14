# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Setup shell options
shopt -s checkwinsize
shopt -s globstar

# Customize history settings
HISTSIZE=1000
HISTFILESIZE=0
HISTCONTROL=ignoreboth

# Enable programmable completion features
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Enable colors in prompt
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Install or update bashprompt
if [ ! -d ~/.bashprompt ]
then
    git clone https://github.com/Remceau/bashprompt.git ~/.bashprompt
else
    git -C ~/.bashprompt pull
fi

# Enable rendering of bashprompt
export BASHPROMPT_NO_STATUSBAR=1
source /data/bashprompt/prompt