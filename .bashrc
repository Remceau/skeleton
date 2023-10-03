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

# Setup bash prompt
__promptline__() {
    # Status code
    if [ $? -eq 0 ]
    then
        color=43
    else
        color=161
    fi
    # Host information
    info="\[$(tput setaf 242)\]\u@\H"
    # Folder information
    if [ -d ".git" ]
    then
        folder="\[$(tput setaf $color)\]\w \[$(tput setaf 242)\]git:$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    else
        folder="\[$(tput setaf $color)\]\w"
    fi

    PS1="$info $folder \[$(tput sgr0)\]$ "
}
PROMPT_COMMAND=__promptline__
