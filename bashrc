mount_dst=${QDEE_DST:-"/home/dev"}

if [ "$PS1" ]; then
    export HISTSIZE=5000
    export HISTCONTROL=ignoreboth
    export HISTFILE=${mount_dst}/.qdee-bash-history
    shopt -s checkwinsize
    PS1='\[\033[01;34m\]\u\[\033[01;36m\]@\h\[\033[01;33m\]:\w \$\[\033[00m\] '
fi

PATH=~/bin:$PATH

source .git_bash_prompt
source /etc/bash_completion

echo "This is your Debian-based Erlang dev environment

* This shell is running in a screen.  Don't try to detach from this
  screen session with C-a C-d (doing so will mess up tty redirections
  and you will lose your shell).  All other screen commands work as
  expected.  To detach, press C-p C-q (run docker attach erlang-22) to
  reattach).

* All packages required to build Riak are installed, as well as emacs
  and git. Should you need other tools, you can do sudo apt-get .. (or
  even su) without a password.

* Your bash history will be preserved in $HISTFILE,
  but ANY FILES OUTSIDE THE BIND-MOUNTED DIR are not, and WILL BE LOST
  once the container is stopped.  "
