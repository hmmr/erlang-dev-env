if [ "$PS1" ]; then
    export HISTSIZE=5000
    export HISTCONTROL=ignoreboth
    export HISTFILE=~/.dev-bash-history
    shopt -s checkwinsize
    PS1='\[\033[01;34m\]\u\[\033[01;36m\]@\h\[\033[01;33m\]:\w \$\[\033[00m\] '
fi

PATH=~/bin:$PATH

source .git_bash_prompt
source /etc/bash_completion

echo "This is your dev env
"
