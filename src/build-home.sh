#!/bin/sh

git config --global init.defaultBranch $DEVENV_GIT_DEF_BRANCH
git config --global user.name $DEVENV_USER
git config --global user.email $DEVENV_EMAIL
git config --global core.editor "NVIM_LISTEN_ADDRESS=/home/$DEVENV_USER/nvimsocket 

nvr --nostart --remote-wait-silent"

