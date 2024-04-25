#!/bin/bash

# Update package databases
yay -Sy

# Get fastest Arch Linux mirrors
yay -S rate-mirrors --noconfirm

echo "Seting mirrors..."

rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

echo "Installing packages..."

# Install packages
yay -S --needed --noconfirm \
  libnotify \
  duf \
  bluetooth-autoconnect \
  xorg-xsetroot \
  tree-sitter-cli \
  peco \
  bc \
  firefox \
  bibata-cursor-theme \
  catppuccin-gtk-theme-mocha \
  nwg-look \
  ly \
  xdg-user-dirs \
  jq \
  ripgrep \
  fd \
  neovim-nightly \
  tmux \
  nemo \
  pamixer \
  playerctl \
  brightnessctl \
  starship \
  cava-git \
  udiskie \
  deno \
  breaktimer \
  tldr \
  ueberzug \
  libmtp \
  mpv \
  hyprpicker \
  hyprshot \
  hyprlock \
  hyprcursor \
  hypridle \
  cliphist \
  qt5-wayland \
  qt6-wayland \
  xdg-desktop-portal-hyprland \
  pywal-git \
  acpi \
  swww \
  swaybg \
  swaync \
  wlogout \
  nm-connection-editor

echo "Everything is ready!"
