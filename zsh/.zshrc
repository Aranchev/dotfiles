# ziode fish

echo "DOTFILES LOADED"

PROMPT='%~: '

export PATH="$PATH:/home/aranchev/.local/bin"

alias space='du -ah --max-depth=1 . 2>/dev/null | sort -h'

alias net='ping google.com'
alias sync='rclone bisync ~/vault "gdrive:My folder/Obsidian" --tpslimit 10 --transfers 4 --checkers 8'

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias tmuxs='tmux source-file ~/dotfiles/tmux/tmux.conf'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

autoload -Uz compinit
compinit

eval "$(zoxide init zsh)"


alias kittyc='nvim ~/.config/kitty/kitty.conf'
alias tmuxconf="tmux source ~/dotfiles/tmux/tmux.conf"
alias src='cd ~/pytest_fundamental/src/_08_txt_processing/ex'
alias test='cd ~/pytest_fundamental/test/'
alias mypytest='cd ~/pytest_fundamental/test/ && PYTHONPATH=/home/aranchev/pytest_fundamental pytest'
alias drag='xinput set-button-map 13 1 9 3 4 5 6 7 8 2'
alias wow='cd /home/aranchev/games/World\ of\ Warcraft\ 3.3.5a && wine Wow.exe'
alias quartz='npx quartz build --serve'
alias quartzweb='xdg-open https://aranchev.github.io/quartz_webvault/'
alias quartzlocal='xdg-open http://localhost:8080'
alias tbc='wine "/home/aranchev/.wine/drive_c/Program Files (x86)/World of Warcraft 2.4.3/Wow.exe"'

flaskblog() {
    cd ~/projects/flask-blog || return
    source venv/bin/activate
    flask run
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
