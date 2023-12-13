<div align="center">

 
```css

┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
 │││ │ │ ├┤ ││  ├┤ └─┐
─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘

```

 

</div>

<p align="center">

 
 ![snapshot](https://github.com/CodeByMeow/.dots/assets/43630437/b96711c3-6bae-4f73-9cc1-36b21c6f4350)

 
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
dunst unclutter duf gpick bluetooth-autoconnect flameshot 
nitrogen  xorg-xsetroot tree-sitter-cli peco
bc nodejs npm firefox  reversal-icon-theme-git bibata-cursor-theme 
nwg-look rofi polybar picom-git ly xdg-user-dirs 
jq rg ripgrep fd neovim tmux nemo betterlockscreen 
youtube-music-bin pamixer playerctl brightnessctl starship cava-git 
xclip udiskie

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
| Super + Space | Laucher     |
| Super + p    | Power menu     |
| Super + b    | Firefox  |
| Super + q    | Kill current window |
| Alt   + n    | Playerctl next |
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
- [Iosevka Mayukai](https://github.com/Iosevka-Mayukai/Iosevka-Mayukai)
- [ Source Han Sans ](https://software.manjaro.org/package/adobe-source-han-sans-jp-fonts)
- Font Awesome 6 Pro
- SF Pro Display (ver Vietnames)

### Music
    youtube-music-bin
### Game
    gamemode mangohud
### Pacman UI
    /etc/pacman.conf: ILoveCandy
### Android file transfer
    android-file-transfer
### Audio controller
    pavucontrol
