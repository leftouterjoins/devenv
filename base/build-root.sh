#!/bin/sh

useradd -m $DEVENV_USER

chsh root -s $(which zsh)
chsh $DEVENV_USER -s $(which zsh)

echo 'root:password' | chpasswd
echo '$DEVENV_USER:$DEVENV_PASS' | chpasswd

echo "$DEVENV_USER ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/$DEVENV_USER

