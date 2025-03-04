#!/bin/bash

# Clone config repo
git clone --depth=1 https://github.com/kartavkun/i3-dotfiles-minimal.git ~/i3-dotfiles-minimal

# Install config
cp -r ~/i3-dotfiles-minimal/config/* ~/.config/

clear
echo "Config installed. Please restart i3 to apply changes."
