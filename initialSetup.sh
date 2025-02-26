#!/bin/bash

echo "set -g mouse" >> $HOME/.tmux.config

if [ whoami != root ]; then
  sudo su root
fi

apt update
apt upgrade -y
apt install -y \
screen \
tmux \
htop \
net-tools \
bmon \
avahi-daemon \
python3 \
python3-pip \
ssh-import-id \
autofs \
wget \
curl \
zip \
unzip \
samba \
ncdu

ssh-import-id-gh bupher

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do apt remove $pkg; done

wget -O get-docker.sh - https://get.docker.com get-docker.sh| bash

apt autoremove
