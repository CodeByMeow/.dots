- **Window Manager** :bento: [ Hyprland ](https://hyprland.org/)
- **Display Manager** :tv: [Ly](https://github.com/fairyglade/ly)
- **Panel** :chocolate_bar: [ Waybar ](https://github.com/Alexays/Waybar)
- **Application Launcher** :rocket: [ Rofi ](https://aur.archlinux.org/packages/rofi-pass-wayland-git)
- **Notification Daemon** :loudspeaker: [Swaync](https://github.com/ErikReider/SwayNotificationCenter)
- **Terminal Emulator** :cat: [ Kitty ](https://sw.kovidgoyal.net/kitty)
- **Shell** :fish: [ Fish ](https://fishshell.com/)
- **File Manager** :duck: [ Yazi ](https://yazi-rs.github.io/docs/)
- **Editor** :fire: [ Neovim ](https://github.com/neovim/neovim) (>= 0.10) (npm install -g neovim)

---

_Warning: Don't blindly use my settings unless you know what that entails. Use at your own risk!_

_Note: I use colemak-dh keyboard layout_

### Required
- `nodejs`
- `npm`

```
    fisher install jorgebucaran/nvm.fish`
```

### Dependencies

```
libnotify duf bluetooth-autoconnect
xorg-xsetroot tree-sitter-cli peco
bc firefox bibata-cursor-theme catppuccin-gtk-theme-mocha
nwg-look ly xdg-user-dirs jq rg ripgrep fd neovim tmux nemo
pamixer playerctl brightnessctl starship cava-git
udiskie deno breaktimer tldr ueberzug libmtp mpv
hyprpicker hyprshoot hyprpaper hyprlock hyprcursor hypridle cliphist qt5-wayland qt6-wayland
xdg-desktop-portal-hyprland pywal
swww swaybg swaync wlogout

```

### Speedup arch
```
preload auto-cpufreq

```

### Ly UI
_Edit: /etc/ly/config.in_
```
animate = true
animation = 1 //Cmatrix
clock = %c
blank_box = false
```

### Shell setup

- [starship](https://starship.rs/) - Shell theme
- [zoxide](https://github.com/ajeetdsouza/zoxide) - Directory jumping
- [peco](https://github.com/peco/peco) - Interactive filtering
- [tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager

### Font
- [ Iosevka ](https://github.com/be5invis/Iosevka)
- [ Source Han Sans CN](https://software.manjaro.org/package/adobe-source-han-sans-cn-fonts)
- [ Source Han Sans KR](https://software.manjaro.org/package/adobe-source-han-sans-kr-fonts)
- JetBrains Mono Nerd Font
- Font Awesome 6 Pro
- Noto fonts
- Iosevka Ori Sans - _My custom Iosevka font_
### UI
    /etc/pacman.conf: ILoveCandy
[Icon ](https://github.com/EliverLara/candy-icons): :candy: Candy icons

### Devtool

- `heyperfine`: Benmarking tool.
- `translate-shell`: command-line translation.
- `bun`: JavaScript runtime and toolkit.

### Tool

- `youtube-music-bin`: Youtube music app.
- `gamemode`
- `mangohud`
- `protontricks`: Ubsoft help.
- `android-file-transfer`: File transfer android.
- `pavucontrol`: Audio configuration.
- `checkupdates`: Checking new update aur

### Input method

- `fcixt5-config-qt`
- `fcixt5-unikey`
- `fcixt5-chinese-addons`
