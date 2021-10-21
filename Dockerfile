FROM erlang:22

RUN apt-get update && apt-get -y install make screen sudo gcc g++ emacs bash-completion

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

CMD while true; do screen -Rd dev -s /bin/bash >/dev/tty 2>/dev/tty </dev/tty; echo -e \"\n\n\n\nC-c to exit, or wait 5 sec to return\"; sleep 5 || exit; done
