if status is-login
	and not set -q DISPLAY
	and test (tty) = "/dev/tty1"
	exec startx -- -keeptty
end
