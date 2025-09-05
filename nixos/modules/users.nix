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

      # gaming
      bottles
      atlauncher

      # cli tools
      starship
      zoxide
      thefuck
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
      rustup

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
    ];
    shell = pkgs.fish;
  };
}
