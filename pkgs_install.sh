#!/bin/bash

# Update package databases
yay -Sy

# Get fastest Arch Linux mirrors
yay -S rate-mirrors --noconfirm

echo ">>> Setting mirrors..."
rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

echo ">>> Install hyprland manual dependencies..."
yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio tomlplusplus hyprlang hyprcursor

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
checkupdates-with-aur \
nm-connection-editor \
networkmanager

echo ">>> Everything is ready!"
