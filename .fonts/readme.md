## Make emoji working in kitty
1. Install twemoji font __ttf-twemoji__
2. Nagivate to `/etc/fonts/conf.d/60-generic.conf`   
Look like
```
<alias binding="same">
	<family>emoji</family>
	<prefer>
		<!-- System fonts -->
		<family>Noto Color Emoji</family> <!-- Google -->
		<family>Apple Color Emoji</family> <!-- Apple -->
		<family>Segoe UI Emoji</family> <!-- Microsoft -->
		<family>Twitter Color Emoji</family> <!-- Twitter -->
		<family>EmojiOne Mozilla</family> <!-- Mozilla -->
		<!-- Third-Party fonts -->
		<family>Emoji Two</family>
		<family>Emoji One</family>
		<!-- Non-color -->
		<family>Noto Emoji</family> <!-- Google -->
		<family>Android Emoji</family> <!-- Google -->
	</prefer>
</alias>
```
Then edit it to look like this:
```
<alias binding="same">
	<family>emoji</family>
	<prefer>
		<!-- System fonts -->
		<family>Twemoji</family> <!-- Twemoji -->
		<family>Noto Color Emoji</family> <!-- Google -->
		<family>Apple Color Emoji</family> <!-- Apple -->
		<family>Segoe UI Emoji</family> <!-- Microsoft -->
		<family>Twitter Color Emoji</family> <!-- Twitter -->
		<family>EmojiOne Mozilla</family> <!-- Mozilla -->
		<!-- Third-Party fonts -->
		<family>Emoji Two</family>
		<family>Emoji One</family>
		<!-- Non-color -->
		<family>Noto Emoji</family> <!-- Google -->
		<family>Android Emoji</family> <!-- Google -->
	</prefer>
</alias>
```
__Twemoji__ is a name of the emoji that was installed.  
Then reload the font cache to get the fonts to work: `fc-cache -f -v`  
To check it is working with `Ctrl`+`Shift`+`U` on the Kitty terminal.
