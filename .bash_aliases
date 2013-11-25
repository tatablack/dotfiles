# Enable ls color support
case "$(uname -s)" in
    Linux)
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        ;;
    Darwin)
        alias ls='ls -G'
        ;;
    *)
        exit
        ;;
esac

# Enable grep color support
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias gitroot='cd $(git rev-parse --show-toplevel)'

# Enable multiple config files for SSH
alias ssh="cat ~/.ssh/config.d/* > ~/.ssh/config; chmod 600 ~/.ssh/config; ssh"

# Let's get some machine-specific aliases
if [ -f ~/.bash_aliases_local ]; then
    . ~/.bash_aliases_local
fi
