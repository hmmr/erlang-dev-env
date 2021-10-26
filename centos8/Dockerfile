FROM centos:8

RUN dnf -y install epel-release
RUN yum -y update
RUN yum -y install git make screen sudo gcc emacs-nox bash-completion less erlang rpm-build

RUN useradd -m dev

# enable our user to su
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/dev

# where contents of your working dir on the host will be mounted into
VOLUME ["/home/dev"]
WORKDIR /home/dev

USER dev

# prettify your screen and bash
ADD screenrc .screenrc
ADD bash_profile .bash_profile
ADD bashrc .bashrc
ADD git_bash_prompt .git_bash_prompt

CMD while true; do screen -Rd dev -s /bin/bash >/dev/tty 2>/dev/tty </dev/tty; echo "C-c to exit, or wait 5 sec to start a new screen session"; sleep 5 || exit; done
