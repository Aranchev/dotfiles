make sure `dotfiles/install.sh` is executable
```
chmod +x ~/dotfiles/install.sh
```
run it
```
cd ~/dotfiles
./install.sh
```
verify the simlinks, for example
```
readlink -f ~/.zshrc
readlink -f ~/.config/tmux/tmux.conf
readlink -f ~/.config/nvim
```
