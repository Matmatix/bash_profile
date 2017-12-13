export PATH="/usr/local/sbin:$PATH"

CLEAR="\[\033[0m\]"
RED="\[\033[1;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[1;33m\]"

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

export PS1="$RED\u$CLEAR@$GREEN\h $YELLOW\w$CLEAR $ "

_ssh()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    #opts=$(grep '^Host' ~/.ssh/config | grep -v '[?*]' | cut -d ' ' -f 2-)
    opts=$(awk '{print $1}' ~/.ssh/known_hosts)
        opts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;`

    COMPREPLY=( $(compgen -W "$opts" -- ${cur}) )
    return 0
}

complete -F _ssh ssh ping dig host telnet nc

alias cdmarq='cd ~/OneDrive/Documents/Marquette/Senior_Year'
