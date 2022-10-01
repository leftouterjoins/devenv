#!/bin/sh

git config --global init.defaultBranch $DEVENV_GIT_DEF_BRANCH
git config --global user.name $DEVENV_USER
git config --global user.email $DEVENV_EMAIL
git config --global core.editor "NVIM_LISTEN_ADDRESS=/home/$DEVENV_USER/nvimsocket nvr --nostart --remote-wait-silent"

git config --global credential.helper store

touch /home/$DEVENV_USER/.git-credentials
echo "https://$DEVENV_GH_USER:$DEVENV_GH_PASS@github.com" >> /home/$DEVENV_USER/.git-credentials
echo "https://$DEVENV_SH_USER:$DEVENV_SH_PASS@git.brickner.cloud" >> /home/$DEVENV_USER/.git-credentials

~/setup.sh

