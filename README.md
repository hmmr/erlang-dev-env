# Erlang developer environment

This is a docker collection of quick and cheap developer environments
for Erlang development, with the absolute minimum of bells and
whistles.  Currently it includes one based on the official `erlang:22`
image (a debian with erlang installed in /usr/local), and one based on
`centos:8` (with Erlang installed from EPEL).

## How to use

* In the respective dirs, run `./build`.

* Once built, do `./run`, optionally with `QDEE_SRC` and `QDEE_DST`
  env vars pointing to the directory on your host filesystem you want
  to bind-mount, and its mount point inside the resulting container.
  By default, `QDEE_SRC` will be set to `$HOME`.

* You will be dropped into a shell, running in a screen session.
  Don't try to detach from it with C-a C-d (doing so will mess up tty
  redirections and you will lose your shell).  All other screen
  commands work as expected.  To detach, press C-p C-q (run docker
  attach qdee-<TAB>) to reattach).

* All packages required to build Riak are installed, as well as emacs
  and git. Should you need other tools, you can do sudo apt-get .. (or
  even su) without a password.

* Your bash history will be preserved in $HISTFILE,
  but ANY FILES OUTSIDE THE BIND-MOUNTED DIR are not, and WILL BE LOST
  once the container is stopped.
