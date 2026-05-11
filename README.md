**All your settings are edited in ~/dotfiles, and those files are symlinked into ~/.config, so the system reads them from .config but you always manage and version-control them from the dotfiles folder.**

edit zsh
```
nvim ~/dotfiles/zsh/.zshrc
```
apply changes 
```
source ~/.zshrc
```
# install on new machine
```
sudo apt update
sudo apt install -y git zsh tmux curl neovim
```
clone the dotfiles
```
git clone git@github.com:aranchev/dotfiles.git ~/dotfiles
cd ~/dotfiles
```
```
chmod +x install.sh
./install.sh
```
```
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
```

# Set zsh as default shell

```
chsh -s $(which zsh)
```
