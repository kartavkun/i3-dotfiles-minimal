#!/bin/bash

# Функция для установки wget с использованием apt (Debian/Ubuntu)
install_with_apt() {
  sudo apt update
  sudo apt install -y git i3-wm i3blocks kitty rofi flameshot
}

# Функция для установки wget с использованием yum (CentOS/Fedora)
install_with_yum() {
  sudo yum install -y git i3-wm i3blocks kitty rofi flameshot
}

# Функция для установки wget с использованием dnf (Fedora)
install_with_dnf() {
  sudo dnf install -y git i3-wm i3blocks kitty rofi flameshot
}

# Функция для установки wget с использованием pacman (Arch Linux)
install_with_pacman() {
  sudo pacman -Sy --noconfirm git i3-wm i3blocks kitty rofi flameshot
}

# Функция для установки wget с использованием zypper (openSUSE)
install_with_zypper() {
  sudo zypper install -y git i3-wm i3blocks kitty rofi flameshot
}

# Определяем пакетный менеджер
if command -v apt &>/dev/null; then
  echo "Detected apt, installing dependencies..."
  install_with_apt
elif command -v yum &>/dev/null; then
  echo "Detected yum, installing dependencies..."
  install_with_yum
elif command -v dnf &>/dev/null; then
  echo "Detected dnf, installing dependencies..."
  install_with_dnf
elif command -v pacman &>/dev/null; then
  echo "Detected pacman, installing dependencies..."
  install_with_pacman
elif command -v zypper &>/dev/null; then
  echo "Detected zypper, installing dependencies..."
  install_with_zypper
else
  echo "Package manager not detected. Please install dependencies manually."
  exit 1
fi

# Clone config repo
git clone --depth=1 https://github.com/kartavkun/i3-dotfiles-minimal.git ~/i3-dotfiles-minimal

# Install config
cp -r ~/i3-dotfiles-minimal/config/* ~/.config/

clear
echo "Config installed. Please restart i3 to apply changes."
