<div align="center">

```css

┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
 │││ │ │ ├┤ ││  ├┤ └─┐
─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘

```
![snapshot](https://github.com/CodeByMeow/dotfiles/assets/43630437/126061cb-53e2-410a-a043-673a4bcf9cb5)

</div>

- **Window Manager** :bento: [ BSPWM ](https://github.com/baskerville/bspwm)
- **Display Manager** 📺 [Ly](https://github.com/fairyglade/ly)
- **Panel** :blossom: [ Polybar ](https://github.com/polybar/polybar)
- **Application Launcher** :rocket: [ Rofi ](https://github.com/davatorium/rofi)
- **Desktop Notification** :herb: [Dunst](https://github.com/dunst-project/dunst)
- **Terminal Emulator** :a: [ Kitty ](https://sw.kovidgoyal.net/kitty)
- **Shell**  [ Nushell ](https://www.nushell.sh)
- **Compositor** :shaved_ice: [Picom](https://github.com/yshui/picom)
- **File Manager** :flower_playing_cards: [ Yazi ](https://yazi-rs.github.io/docs/)
- **Editor** :pencil2: [ Neovim ](https://github.com/neovim/neovim) (>= 0.9)

---

_Warning: Don't blindly use my settings unless you know what that entails. Use at your own risk!_

### AUR Helper

**Yet Another Yogurt** :heart: [yay](https://github.com/Jguer/yay)

### Software

```
sxhkd cava dunst unclutter duf
acpilight gpick bluetooth-autoconnect flameshot
nitrogen playerctl xorg-xsetroot
tree-sitter-cli peco onefetch
jq bc rg yd ripgrep fd nodejs npm lxappearance nemo
firefox-developer-edition
betterlockscreen postbird
```

### Shell setup

- [ starship ](https://starship.rs/) - Shell theme
- [z](https://github.com/ajeetdsouza/zoxide) : - Directory jumping
- [peco](https://github.com/peco/peco) - Interactive filtering
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
  - [tpm](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager

### Polybar
Module weather: You need create api file with only key in __.owm-key__ from https://openweathermap.org/api  
Change your local in file from path: ~/.config/polybar/scripts/Weather/weather
```
    APIKEY=`cat ~/.config/polybar/scripts/Weather/.owm-key`
    CITY_NAME='Ho Chi Minh City'
    COUNTRY_CODE=VN
    # Desired output language
    LANG="vi"
```

### System

- [light](https://archlinux.org/packages/community/x86_64/light/):bulb: - Backlight controllers

  ```
  sudo chmod +s (which light)
  ```

### Font

- [ Victor Mono ](https://rubjo.github.io/victor-mono/)
- [ Iosevka ](https://github.com/be5invis/Iosevka)
- Font Awesome 6 Pro
- JetBrains Mono Nerd Font
- [ Source Han Sans ](https://software.manjaro.org/package/adobe-source-han-sans-jp-fonts)
- SF Pro Display (ver Vietnames)

### Icon
    Papirus-icon-theme

### Music
    youtube-music-bin
