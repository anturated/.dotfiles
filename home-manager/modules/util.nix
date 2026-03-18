{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # rice-related
    hyprshot
    hyprls
    hyprsunset
    matugen
    quickshell

    # obscure stuff i don't know much about
    lenovo-legion
    # pinentry # required for gpg signing i think
    kdePackages.qtdeclarative # for qmlls
    gnome-disk-utility

    # usability
    pavucontrol
    appimage-run
    gnome-calculator
    nautilus
    feh
    eog
    piper

    # for prime testing
    kdePackages.kate
    kdePackages.ark

    # video
    vlc
    gpu-screen-recorder-gtk
    gpu-screen-recorder
    losslesscut-bin

    okteta

    usbutils
    xdg-desktop-portal-hyprland
  ];

}
