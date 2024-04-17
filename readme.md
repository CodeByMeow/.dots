- **Window Manager** :bento: [ Hyprland ](https://hyprland.org/)
- **Display Manager** :tv: [Ly](https://github.com/fairyglade/ly)
- **Panel** :blossom: [ Waybar ](https://github.com/Alexays/Waybar)
- **Application Launcher** :rocket: [ Wofi ](https://hg.sr.ht/~scoopta/wofi)
- **Desktop Notification** :herb: [Dunst](https://github.com/dunst-project/dunst)
- **Terminal Emulator** :cat: [ Kitty ](https://sw.kovidgoyal.net/kitty)
- **Shell** :fish: [ Fish ](https://fishshell.com/)
- **File Manager** :flower_playing_cards: [ Yazi ](https://yazi-rs.github.io/docs/)
- **Editor** :sunglasses: [ Neovim ](https://github.com/neovim/neovim) (>= 0.10) (npm install -g neovim)

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
libnotify dunst unclutter duf bluetooth-autoconnect
xorg-xsetroot tree-sitter-cli peco
bc firefox bibata-cursor-theme catppuccin-gtk-theme-mocha
nwg-look ly xdg-user-dirs jq rg ripgrep fd neovim tmux nemo
pamixer playerctl brightnessctl starship cava-git
udiskie deno breaktimer tldr ueberzug at libmtp mpv
hyprpicker hyprshoot hyprpaper hyprlock hyprcursor cliphist qt5-wayland qt6-wayland
xdg-desktop-portal-hyprland pywal

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
[Icon theme](https://github.com/EliverLara/candy-icons): Candy icons

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
