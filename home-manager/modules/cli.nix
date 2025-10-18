{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # tools
    starship
    zoxide
    asdf-vm
    jq
    fzf
    ripgrep
    gh
    killall
    zip
    unzip
    wl-clipboard
    xclip

    # actual software
    yazi
    btop
    nvtopPackages.full
    lazygit
    gdu
    eza
    bat
    fastfetch
    brightnessctl
    playerctl
    bluetui
    cava
  ];
}
