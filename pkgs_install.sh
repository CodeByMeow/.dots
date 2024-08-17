#!/bin/bash

echo ">>> Install manual dependencies..."
yay -S --needed gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms \
libxfixes libx11 libxcomposite xorg-xinput libxrender pixman cairo pango seatd \
libxkbcommon xcb-util-wm libinput libliftoff libdisplay-info cpio tomlplusplus

echo ">>> Installing packages..."
yay -S --needed libnotify duf bluetooth-autoconnect xorg-xsetroot tree-sitter-cli peco bc \
nwg-look jq ripgrep fd tmux nemo pamixer pavucontrol \
playerctl brightnessctl starship udiskie deno tldr ueberzugpp libmtp mpv acpi

echo ">>> Everything is ready!"
