
ISYAY=/sbin/yay
if [[ -f $ISYAY ]]; then
    echo -e "yay was located, moving on."
else
    echo -e "yay was not located, pluase install yay. Exiting script.\n"
    exit
fi

### Install package ###
read -n1 -rep "Would you like install BSPWM and SXHKD? [ y,n ] " INST
if [[ $INST == "y" || $INST == "Y" ]]; then
    yay -S --noconfirm bspwm sxhkd networkmanger
    echo -e "Starting NetWorkManager...\n"
    sudo systemctl enable NetworkManager
    sudo systemctl start --now NetworkManager
    sleep 2
fi
read -n1 -rep "Would you like install package? [ y,n ] " PKG 
if [[ $PKG == "y" || $PKG == "Y" ]]; then
    echo -e "Installing package...\n"
    yay -S --noconfirm xorg xorg-xinit xorg-xsetroot \
        rofi polybar picom-allusive ly xdg-user-dirs \
        jq rg ripgrep fd neovim tmux nemo betterlockscreen \
        youtube-music-bin pamixer playerctl brightnessctl starship cava-git \
        xclip udiskie
fi

read -n1 -rep "Would you like install gtk theme? [ y,n ] " GTK 
if [[ $GTK == "y" || $GTK == "Y" ]]; then
    echo -e "Installing gtk theme...\n"
    yay -S --noconfirm nwg-look bettergruvbox-gtk-theme reversal-icon-theme bibata-cusor-theme
    echo -e "Installing font...\n"
    yay -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk adobe-source-han-sans-jp-fonts

    echo -e "Reload font...\n"
    fc-cache -fv

fi
read -n1 -rep "Would you like install bluetooth? [ y,n ] " BLT 
if [[ $BLT == "y" || $BLT == "Y" ]]; then
    yay -S --noconfirm bluez bluez-utils blueman
    echo -e "Starting Bluetooth Service... \n"
    sudo systemctl enable --now bluetooth.service
    sleep 2
fi

read -n1 -rep "Create user dir ? [ y,n ] " USRDIR 
if [[ $USRDIR ]]; then
    xdg-user-dirs-update   
    echo -e "Created user dir :) \n"
fi

echo -e "Installing Tmux Manager...\n"
tmp_dir=~/.config/tmux/plugins/tpm
if [[ -d $tmp_dir ]]; then
    echo -e "File exist, skip...\n"
else
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
echo -e "Installing tmux package...\n"
~/.config/tmux/plugins/tpm/bin/install_plugins
echo -e "Done...\n"

echo -e "Reboot and enjoy!\n"
