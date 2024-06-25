#!/bin/bash

# Update package databases
yay -Sy

# Get fastest Arch Linux mirrors
yay -S rate-mirrors --noconfirm

echo ">>> Setting mirrors..."
rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

echo ">>> Install manual dependencies..."
yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman  cairo pango seatd libxkbcommon xcb-util-wm  libinput libliftoff libdisplay-info cpio tomlplusplus 

echo ">>> Installing packages..."

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
whitesur-icon-theme \
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
pavucontrol \
playerctl \
brightnessctl \
starship \
cava-git \
udiskie \
deno \
breaktimer \
tldr \
ueberzugpp \
libmtp \
mpv \
acpi \
checkupdates-with-aur \
nm-connection-editor \
networkmanager-git \
rofi-gpaste-git \

echo ">>> Everything is ready!"
