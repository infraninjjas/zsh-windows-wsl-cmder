#!/bin/bash
#
# The purpose of this script is to setup a baseline environment for WSL / Ubuntu
#

# Script needs to be run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi
SCRIPT_USER=$SUDO_USER
ZSHRC="/home/$SCRIPT_USER/.zshrc"
# Download necessary repositories and install necessary packages.

# Packages

apt-get install git
apt-get install zsh

# Repositories

#repositories for enabling better colors.
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark --output ~/.dircolors
git clone https://github.com/subnixr/minimal.git
mv minimal /home/$SCRIPT_USER/.minimal

# Enable dircolors in zshrc
echo "## set colors for LS_COLORS" >> $ZSHRC
echo "eval `dircolors ~/.dircolors`" >> $ZSHRC

#Set zsh theme to minimal
echo "source /home/$SCRIPT_USER/.minimal/minimal.zsh" >> $ZSHRC

# Enable zsh to launch whenever shell is started via bashrc

echo "if test -t 1; then" >> /home/$SCRIPT_USER/.bashrc
echo "	exec zsh" >> /home/$SCRIPT_USER/.bashrc
echo "fi" >> /home/$SCRIPT_USER/.bashrc
