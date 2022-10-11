<div align="center">

```css

┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
 │││ │ │ ├┤ ││  ├┤ └─┐
─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘

```

</div>

- **Window Manager** :bento: [ BSPWM ](https://github.com/baskerville/bspwm)
- **Panel** :blossom: [ Polybar ](https://github.com/polybar/polybar)
- **Application Launcher** :rocket: [ Rofi ](https://github.com/davatorium/rofi)
- **Desktop Notification** :herb: [Dunst](https://github.com/dunst-project/dunst)
- **Terminal Emulator** :cat: [ Kitty ](https://github.com/kovidgoyal/kitty)
- **Shell** 🐟 [ Fish ](https://github.com/fish-shell/fish-shell)
- **Compositor** :shaved_ice: [Picom](https://github.com/yshui/picom)
- **File Manager** :flower_playing_cards: [ Ranger ](https://github.com/ranger/ranger)
- **Editor** :pencil2: [ Neovim ](https://github.com/neovim/neovim) (>= 0.8)

---

### (Majaro OS)

> Point to the Fastest Mirror and Update your System

```
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu
pacman -S --needed git base-devel
```

### AUR Helper

**Yet Another Yogurt** :heart: [yay](https://github.com/Jguer/yay)

### Software

```
sxhkd cava dunst unclutter peco duf
xorg-xsetroot acpilight light gpick
blueman bluetooth-autoconnect flameshot
fd feh nautilus lxappearance breeze logo-ls playerctl
peaclock
```

### Shell setup

- :sparkles: [ starship ](https://starship.rs/) - Shell theme
- [z for fish](https://github.com/jethrokuan/z) : - Directory jumping  
  `fisher install jethrokuan/z`
- `kitty +kitten theme` - Terminal color scheme. I use Gruvbox material

### System

- **Light**:bulb: `sudo chmod +s (which light)`

### Font

- [ Victor Mono ](https://rubjo.github.io/victor-mono/)
- [ Iosevka ](https://github.com/be5invis/Iosevka)
- Montserrat

### Break and save eye

No sound :sound: `alsactl restore`

BreakTimer:bed: `breaktimer`

#### Keyboard Keychrone K2 swap Fn

- Set the keyboard to :keyboard: Windows mode via the side switch.
- Use **Fn + X + L** (hold for 4 seconds) to set the function key row to "Function" mode. (usually all that's necessary on Windows)
- `echo 0 | sudo tee /sys/module/hid_apple/parameters/fnmode`
- To persist this change, add a module option for hid_apple:
- ```
  echo "options hid_apple fnmode=0" | sudo tee -a /etc/modprobe.d/hid_apple.conf
  ```
- You may need to rebuild your `initramfs` if `hid_apple` is included.
  - ubuntu: `sudo update-initramfs -u`
  - arch: `mkinitcpio -P`
