#!/bin/bash

sudo cp /etc/nixos/hardware-configuration.nix /$HOME/.dotfiles/nixos
sudo rm -rf /etc/nixos/*
sudo cp -r $HOME/.dotfiles/nixos/* /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos

rm -rf $HOME/.config/hypr/*
cp -r $HOME/.dotfiles/shell/hypr/* $HOME/.config/hypr
hyprctl reload
