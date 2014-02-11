FROM base/devel:minimal
MAINTAINER Brian Tomlinson <brian.tomlinson@linux.com>

ADD mirrorlist /etc/pacman.d/mirrorlist
RUN pacman-key --init && pacman-key --populate archlinux
RUN pacman -Syyuu --noconfirm
RUN pacman -S --noconfirm git rsync subversion mercurial go vim htop; rm /var/cache/pacman/pkg/*
ENV GOROOT /usr/lib/go
ENV GOPATH $HOME/go
RUN mkdir -p $HOME/go/src $HOME/go/pkg $HOME/go/bin $HOME/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin:$HOME/bin
