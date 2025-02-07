#!/bin/bash

tmp_img=$(mktemp /tmp/fzf-preview.XXXXXXXXXX)
tmp_ueberzug_file=""

# Choose image previewer
if command -v ueberzug > /dev/null; then
    image_preview="ueberzug_preview"
    # Initialize ueberzug (listen to /tmp/fzf-ueberzug.XXXXXXXXXX)
    tmp_ueberzug_file=$(mktemp /tmp/fzf-ueberzug.XXXXXXXXXX)
    if command -v ueberzugpp > /dev/null; then
        tail -f --pid=$$ $tmp_ueberzug_file 2> /dev/null | ueberzugpp layer --silent &
    else
        tail -f --pid=$$ $tmp_ueberzug_file 2> /dev/null | ueberzug layer --silent &
    fi
elif [[ $KITTY_WINDOW_ID ]]; then
    image_preview="kitty_preview"
elif command -v chafa > /dev/null; then
    image_preview="chafa_preview"
elif command -v catimg > /dev/null; then
    image_preview="catimg_preview"
else
    image_preview="no_image_preview"
fi

cleanup () {
    # Clear last image and remove temporary files
    if command -v ueberzug > /dev/null; then
        echo '{"action": "remove", "identifier": "fzf"}' >> $tmp_ueberzug_file
    fi
    rm -f $tmp_img $tmp_ueberzug_file
}
trap cleanup HUP

# Set fzf command
if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND='fd -H --type file'
fi

# Set fzf default options (preview command, refresh on terminal resize, show header)
export FZF_DEFAULT_OPTS="\
    --color=bg:#2d353b,bg+:#3a4248,fg:#d3c6aa,fg+:#e67e80
--color=hl:#a7c080,hl+:#7fbbb3
--color=info:#dbbc7f,prompt:#a7c080,pointer:#e67e80,marker:#e67e80,spinner:#dbbc7f
--border --height 60% --layout=reverse
--preview '$(dirname "$0")/fzf-file2preview.sh {} $image_preview $tmp_img $tmp_ueberzug_file'
--bind 'resize:refresh-preview' --bind 'focus:transform-header:file --brief {}'"

dir="${1:-.}"

if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND="fd -H -tf \"$dir\""
else
    export FZF_DEFAULT_COMMAND="find --type f \"$dir\""
fi

# Run fzf and bind to a file opener
fzf --multi --bind "enter:execute(fish -c 'set mime (file --mime-type -b {+}); \
    if string match -q \"image/*\" \$mime; \
        $BROWSER {+}; \
    else; \
        nvim {+}; \
    end')+abort"

cleanup
