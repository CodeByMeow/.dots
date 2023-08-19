yay -S rate-mirrors
rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
