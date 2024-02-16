<p align="center">

 ![snap](https://github.com/CodeByMeow/.dots/assets/43630437/9fe7e4f2-630e-4e86-8911-af2ad0417b37)

 
</p>


- **Window Manager** :bento: [ BSPWM ](https://github.com/baskerville/bspwm)
- **Display Manager** :tv: [Ly](https://github.com/fairyglade/ly)
- **Panel** :blossom: [ Polybar ](https://github.com/polybar/polybar)
- **Application Launcher** :rocket: [ Rofi ](https://github.com/davatorium/rofi)
- **Desktop Notification** :herb: [Dunst](https://github.com/dunst-project/dunst)
- **Terminal Emulator** :cat: [ Kitty ](https://sw.kovidgoyal.net/kitty)
- **Shell** :fish: [ Fish ](https://fishshell.com/)
- **Compositor** :shaved_ice: [Picom](https://github.com/yshui/picom)
- **File Manager** :flower_playing_cards: [ Yazi ](https://yazi-rs.github.io/docs/)
- **Editor** :sunglasses: [ Neovim ](https://github.com/neovim/neovim) (>= 0.9)

---

_Warning: Don't blindly use my settings unless you know what that entails. Use at your own risk!_

_Note: I use colemak-dh keyboard layout_

### Dependencies

```
libnotify dunst unclutter duf gpick bluetooth-autoconnect flameshot 
nitrogen  xorg-xsetroot tree-sitter-cli peco
bc nodejs npm firefox  reversal-icon-theme-git bibata-cursor-theme 
nwg-look rofi polybar picom-git ly xdg-user-dirs 
jq rg ripgrep fd neovim tmux nemo betterlockscreen 
youtube-music-bin pamixer playerctl brightnessctl starship cava-git 
xclip udiskie deno breaktimer tldr rofimoji rofi-calc
ueberzug at

```

### Speedup arch
```
preload auto-cpufreq

```

### Ly UI
Edit: /etc/ly/config.in
```
animate = true
animation = 1 //Cmatrix
clock = %c
blank_box = false
```

### Shell setup

[ starship ](https://starship.rs/) - Shell theme  
[zoxide](https://github.com/ajeetdsouza/zoxide) - Directory jumping  
[peco](https://github.com/peco/peco) - Interactive filtering  
[tmux](https://github.com/tmux/tmux) - Terminal multiplexer  
[tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager

### Common hotkey
| Key  | Description   |
|-------------- | -------------- |
| Super + Enter | Kitty     |
| Super + Space | Laucher  rofi  |
| Super + p    | Power menu     |
| Super + b    | Firefox  |
| Super + q    | Kill current window |
| Alt   + Right| Playerctl next |
| Alt   + p    | Playerctl play-pause |
| Ctrl + Shift + Space| Color pick |

See more in sxhkd config: _~/.config/sxhkd/sxhkdrc_

To use custom script: `sudo ln -s $HOME/custom/script/<namescript>.sh <namescript>`

### Polybar
__Module weather__ :cloud_with_lightning_and_rain: store apikey in __.owm-key__. [Get api](https://openweathermap.org/api)  
Change your local in file from path: ~/.config/polybar/scripts/Weather/weather
```
    APIKEY=`cat ~/.config/polybar/scripts/Weather/.owm-key`
    CITY_NAME='Ho Chi Minh City'
    COUNTRY_CODE=VN
    # Desired output language
    LANG="vi"
```

### Font
- [ Iosevka ](https://github.com/be5invis/Iosevka) 
- [ Source Han Sans CN](https://software.manjaro.org/package/adobe-source-han-sans-cn-fonts)
- JetBrains Mono Nerd Font
- Font Awesome 6 Pro
- Noto fonts
- Twemoji fonts
- Iosevka Ori Sans - _My custom Iosevka font_

### Music
    youtube-music-bin
### Game
    gamemode mangohud
### Fix Ubisoft connect
    protontricks
### Pacman UI
    /etc/pacman.conf: ILoveCandy
### Android file transfer
    android-file-transfer
### Audio controller
    pavucontrol
### Funny
    pipes.sh peaclock
