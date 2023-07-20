yay -S rate-mirrors
rate-mirror --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist
