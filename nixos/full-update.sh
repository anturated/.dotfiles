#!/usr/bin/env bash

# free some space
echo ">>> Collecting garbage... (as root)"
sudo nix-collect-garbage -d

echo ">>> Collecting garbage... (as user)"
nix-collect-garbage -d

echo ">>> Expiring home-manager..."
home-manager expire-generations "-1 days"

# update channels
echo ">>> Updating nix channel... (as root)"
sudo nix-channel --update
echo ">>> Updating nix channel... (as user)"
nix-channel --update

# update configs + switch
echo ">>> Updating nix config..."
./update-cfg.sh
echo ">>> Switching home-manager..."
home-manager switch

# optimize
echo ">>> Optimizing... (as root)"
sudo nix-store --optimise

echo ">>> Optimizing... (as user)"
nix-store --optimise
