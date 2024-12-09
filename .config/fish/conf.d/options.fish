set -U fish_greeting
set -Ux EDITOR nvim
set -Ux VISUAL nvim

fish_add_path -g ~/.node-modules/ ~/.node-modules/bin ~/.node-modules/ /share/man ~/.cargo/bin

if status is-login
	and not set -q DISPLAY
	and test (tty) = "/dev/tty1"
	exec startx -- -keeptty
end
