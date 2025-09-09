{ pkgs, ... }:

{
  home.packages = [
    pkgs.starship
    pkgs.zoxide
    pkgs.asdf-vm
    pkgs.jq
    pkgs.yazi
    pkgs.btop
    pkgs.lazygit
    pkgs.fzf
    pkgs.ripgrep
    pkgs.gdu
    pkgs.gh
    pkgs.killall
    pkgs.eza
    pkgs.bat
    pkgs.fastfetch
    pkgs.brightnessctl
    pkgs.playerctl
    pkgs.bluetui
    pkgs.cava
  ];
}
