<div align="center">

```css

┌┬┐┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐
 │││ │ │ ├┤ ││  ├┤ └─┐
─┴┘└─┘ ┴ └  ┴┴─┘└─┘└─┘

```

</div>

- **Window Manager** :bento: BSPWM
- **Panel** :blossom: Polybar
- **Application Launcher** :rocket: Rofi
- **Desktop Notification** :herb: [Dunst](https://github.com/dunst-project/dunst)
- **Terminal Emulator** :cat: Kitty
- **Shell** 🐟 Fish
- **Compositor** :shaved_ice: [Picom](https://github.com/yshui/picom)
- **File Manager** :flower_playing_cards: Ranger
- **Editor** :pencil2: Neovim

---

### (manjaro) Point to the Fastest Mirror and Update your System

```
sudo pacman-mirrors --fasttrack
sudo pacman -Syyu
pacman -S --needed git base-devel
```

### AUR Helper

**Yet Another Yogurt** :heart: [yay](https://github.com/Jguer/yay)

### Software

```
sxhkd cava neovim dunst unclutter peco duf
xorg-xsetroot acpilight light gpick
blueman bluetooth-autoconnect lazygit flameshot
fd feh dolphin lxappearance breeze logo-ls playerctl
```

### GUI terminal

- **Fish theme** :sparkles: `starship`
- **Z jump** : `fisher install jethrokuan/z`
- **Kitty**:seedling: `kitty +kitten theme`

- **Light**:bulb: `sudo chmod +s (which light)`

### Font

- Victor Mono
- Iosevka
- Montserrat

### Fix some error

No sound :sound: `alsactl restore`

### Break and save eye

**BreakTimer:bed:** `breaktimer`

### Keyboard Keychrone K2 swap Fn

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

