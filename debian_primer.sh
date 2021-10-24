#!/bin/sh

# This is a script to help with quickly setting up a new debian installation.

INSTALL_PACKAGES="build-essential vim git"

VIM_CONFIGURATION_URL="https://github.com/klemor97/VimConfiguration/raw/main/.vimrc"

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install specified packages
sudo apt-get install $INSTALL_PACKAGES

# Read values for GitHub configuration
echo "Please enter a value for GitHub user.name:"
read GITHUB_USER_NAME

echo "Please enter a value for GitHub user.email:"
read GITHUB_USER_EMAIL

# Congigure GitHub based on read values
git config --global user.name "$GITHUB_USER_NAME"
git config --global user.email "$GITHUB_USER_EMAIL"

# Download .vimrc file from GitHub
wget -P /home/${USER}/ "$VIM_CONFIGURATION_URL"

# Set GNOME Terminal settings
GNOME_TERMINAL_PROFILE_ID=`dconf list /org/gnome/terminal/legacy/profiles:/ | grep "^:"`

dconf write /org/gnome/terminal/legacy/profiles:/"$GNOME_TERMINAL_PROFILE_ID"use-theme-colors "false"
dconf write /org/gnome/terminal/legacy/profiles:/"$GNOME_TERMINAL_PROFILE_ID"foreground-color "'rgb(255,255,255)'"
dconf write /org/gnome/terminal/legacy/profiles:/"$GNOME_TERMINAL_PROFILE_ID"background-color "'rgb(0,0,0)'"
dconf write /org/gnome/terminal/legacy/profiles:/"$GNOME_TERMINAL_PROFILE_ID"audible-bell "false"
