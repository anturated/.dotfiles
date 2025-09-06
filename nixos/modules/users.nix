{ config, pkgs, ... }:

{
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # basic
      vivaldi
      telegram-desktop
      vesktop
      spotify
      spicetify-cli

      # gaming
      bottles
      atlauncher

      # cli tools
      starship
      zoxide
      thefuck
      asdf-vm
      jq
      yazi
      btop
      lazygit
      fzf
      ripgrep
      gdu
      gh
      ttyper
      killall
      eza
      bat
      fastfetch
      brightnessctl
      playerctl
      bluetui
      cava

      # code
      nodejs_24
      rustc
      cargo
      gcc

      # util
      pavucontrol
      hyprshot
      matugen
      nautilus
      seahorse
      lenovo-legion
      pinentry # required for gpg signing i think
      baobab
      kdePackages.kate
      appimage-run
      gnome-disk-utility
    ];
    shell = pkgs.fish;
  };
}
