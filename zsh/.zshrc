echo "DOTFILES LOADED"

PROMPT='%~: '

export PATH="$PATH:/home/aranchev/.local/bin"

alias space='du -ah --max-depth=1 . 2>/dev/null | sort -h'

alias net='ping google.com'

alias sync='rclone bisync ~/vault "gdrive:My folder/Obsidian"'

alias kittyc='nvim ~/.config/kitty/kitty.conf'

alias src='cd ~/pytest_fundamental/src/_08_txt_processing/ex'
alias test='cd ~/pytest_fundamental/test/'
alias mypytest='cd ~/pytest_fundamental/test/ && PYTHONPATH=/home/aranchev/pytest_fundamental pytest'
