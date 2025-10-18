{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # rice-related
    hyprshot
    hyprls
    hyprsunset
    matugen

    # obscure stuff i don't know much about
    lenovo-legion
    pinentry # required for gpg signing i think
    kdePackages.qtdeclarative # for qmlls
    gnome-disk-utility

    # usability
    pavucontrol
    appimage-run
    gnome-calculator
    nautilus
    feh

    # for prime testing
    kdePackages.kate
    lshw
    mesa-demos
    kdePackages.ark

    # video
    vlc
    gpu-screen-recorder-gtk
    gpu-screen-recorder
    obs-studio
    losslesscut-bin
    # 
  ];

  services.kdeconnect.enable=true;
}
