FROM ubuntu:21.10 AS devinstall

ARG DEVENV_USER
ARG DEVENV_PASS
ARG DEVENV_EMAIL
ARG DEVENV_LOCALE
ARG DEVENV_PKGS

ENV TZ=$DEVENV_TZ
ENV DEVENV_USER=$DEVENV_USER
ENV DEVENV_PASS=$DEVENV_PASS
ENV DEVENV_EMAIL=$DEVENV_EMAIL
ENV DEVENV_LOCALE=$DEVENV_LOCALE
ENV DEVENV_PKGS=$DEVENV_PKGS

ENV DEBIAN_FRONTEND=noninteractive

COPY base/build-install.sh /build-install.sh
RUN chmod +x /build-install.sh && /build-install.sh


FROM devinstall AS devbase

COPY base/build-root.sh /build-root.sh
RUN chmod +x /build-root.sh && /build-root.sh


FROM devbase AS devinit

COPY base/build-init-user.sh /build-init-user.sh

USER ${DEVENV_USER}

WORKDIR /home/${DEVENV_USER}
ENV LANG=en_US.UTF-8

RUN cp /build-init-user.sh ./build-init-user.sh && chmod +x ./build-init-user.sh && ./build-init-user.sh


FROM devinit AS devenv

USER ${DEVENV_USER}
WORKDIR /home/${DEVENV_USER}

ENV GOPATH=/home/${DEVENV_USER}/go
ENV NVIM_LISTEN_ADDRESS=/home/${DEVENV_USER}/nvimsocket

COPY base/zshrc /home/${DEVENV_USER}/.zshrc
COPY base/init.vim /home/${DEVENV_USER}/.config/nvim/init.vim
COPY dotfiles/setup.sh /home/${DEVENV_USER}/setup.sh
COPY dotfiles/init.vim /home/${DEVENV_USER}/dotfiles/init.vim
COPY dotfiles/zshrc /home/${DEVENV_USER}/dotfiles/zshrc

COPY base/build-home.sh /home/${DEVENV_USER}/build-home.sh

RUN sudo chown -R ${DEVENV_USER}:${DEVENV_USER} /home/${DEVENV_USER} \
  && chmod +x /home/${DEVENV_USER}/*.sh \
  && /home/${DEVENV_USER}/build-home.sh 

VOLUME /home/${DEVENV_USER}/.config
VOLUME /home/${DEVENV_USER}/host

ENTRYPOINT ["nvim", "+cd ~/host"]

