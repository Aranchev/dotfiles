#!/bin/bash

echo "Setting up dotfiles..."

mkdir -p ~/.config/nvim ~/.config/tmux ~/.config/zsh

link() {
  target="$1"
  dest="$2"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    rm -rf "$dest"
  fi

  ln -s "$target" "$dest"
}

link ~/dotfiles/nvim ~/.config/nvim
link ~/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
link ~/dotfiles/zsh/.zshrc ~/.zshrc

echo "Done."
