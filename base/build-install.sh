#!/bin/sh

apt update -y
apt upgrade
apt install -y locales tzdata

locale-gen en_US.UTF-8

:> /etc/environment
echo "LC_ALL=$DEVENV_LOCALE" >> /etc/environment
echo "LANGUAGE=$DEVENV_LOCALE" >> /etc/environment
echo "LANG=$DEVENV_LOCALE" >> /etc/environment
echo "LC_TYPE=$DEVENV_LOCALE" >> /etc/environment

dpkg-reconfigure locales

ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
dpkg-reconfigure tzdata

INSTALL_CMD="apt install --no-install-recommends -y zsh python2 python3 python3-pip ruby ruby-all-dev nodejs npm sudo curl perl git build-essential"
$INSTALL_CMD

gem install neovim


npm install -g n
npm install -g neovim

curl -sfL https://cpanmin.us | perl - App::cpanminus

curl -s https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
python2 get-pip.py

curl -s -L -o nvim-linux64.tar.gz https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
tar -xvzf nvim-linux64.tar.gz
cp -ran /nvim-linux64/* /usr

chmod +x /usr/bin/nvim

