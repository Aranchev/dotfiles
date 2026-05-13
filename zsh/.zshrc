echo "DOTFILES LOADED"

PROMPT='%~: '

# Created by `pipx` on 2026-05-12 10:09:43
export PATH="$PATH:/home/aranchev/.local/bin"

# check space in dir folders and files ordered
alias space='du -ah --max-depth=1 . 2>/dev/null | sort -h'

alias net='ping google.com'



alias sync='rclone bisync ~/vault "gdrive:My folder/Obsidian"'
