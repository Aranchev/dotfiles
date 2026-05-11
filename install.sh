#!/bin/bash

set -e

echo "🔧 Setting up dotfiles..."

# Neovim
echo "→ Linking Neovim"
ln -sf ~/dotfiles/nvim ~/.config/nvim

echo "✅ Done. Restart terminal or open nvim."
