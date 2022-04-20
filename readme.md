## README
---
<p align="center">
  <img width="300" height="300" src="./logo/catinbox.jpg">
</p>

### Update distro after install from iso (manjaro)  
  `sudo pacman-mirrors --fasttrack`  
  `sudo pacman -Syyu`  
  `pacman -S --needed git base-devel`
### Installer Manager  
  [yay](https://github.com/Jguer/yay)  
### Software
`kitty` `bspwm` `sxhdk` `picom` `polybar` `fish` `cava` `rofi` `neofetch` `neovim` `ranger` `dunst` `uclutter` `peco`
`xcorg-xsetroot` `acpilight` `light` `bluez-ultils` `blueman` `bluetooth-autoconnect` `ripgrep` `lazygit` `flameshot`
`lolcat` `fd` `feh` `betterclockscreen` `dolphin` `lxappearance` `breeze`

### GUI terminal and customize with Gruvbox colorscheme
_Fishell:_ `curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish`  
_Fish theme:_ `omf instal bobthefish`  
_Kitty:_ `kitty +kitten theme` . And select ___gruvbox dark___

_Light:_ `sudo chmod +s (which light)`
###  Neovim  
Some packages require by plugins: 

- _Packages_ _manager:_ ___Packer___  
`git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`  
 
- `nodejs` `npm`
- `pip install ueberzug` `python3`

<details>
    <summary>
        Note
    </summary>
    <br>
    Run checkheath in neovim command to make sure config working.
</details>

### Load myconfig
You just run this command:  

`curl https://raw.githubusercontent.com/katinbox/dotfiles/main/scripts/config-init.sh | bash`  

### Keyboard Keychrone K2 swap Fn 
[here](https://mikeshade.com/posts/keychron-linux-function-keys)  

### Font 
[Victor Mono](https://rubjo.github.io/victor-mono/)  


### Fix some error
Nerd font not load: let install `ttf-nerd-fonts-symbols`  
No sound: `alsactl restore`

### Break and save eye
__F.lux:__ `xflux`  
__BreakTimer:__ `breaktimer`

