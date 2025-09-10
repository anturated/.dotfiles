{ pkgs, ... }:

{
  home.packages = [
    pkgs.pavucontrol
    pkgs.hyprshot
    pkgs.hyprls
    pkgs.hyprsunset
    pkgs.matugen
    pkgs.lenovo-legion
    pkgs.pinentry # required for gpg signing i think
    pkgs.kdePackages.kate
    pkgs.appimage-run
    pkgs.kdePackages.qtdeclarative # for qmlls
    pkgs.amberol # music player
    pkgs.nvtopPackages.full
    pkgs.gnome-calculator
  ];
}
