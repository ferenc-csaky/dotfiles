#!/usr/bin/env bash

mkdir -p ~/.config/tmux

stow -t ~ zsh
stow -t ~/.config/tmux tmux
