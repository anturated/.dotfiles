{ pkgs, ... }:

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

      # gaming
      bottles
      atlauncher

      # cli tools
      starship
      zoxide
      asdf-vm
      jq
      yazi
      btop
      lazygit
      fzf
      ripgrep
      gdu
      gh
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
      hyprls
      hyprsunset
      matugen
      # lenovo-legion
      pinentry # required for gpg signing i think
      kdePackages.kate
      appimage-run
      kdePackages.qtdeclarative # for qmlls
      amberol # music player
      nvtopPackages.full

      # temp
      mpd
      mpc
      ncmpcpp
      ario

      lshw
      xorg.xrandr
    ];
    shell = pkgs.fish;
  };

  programs.thunar.enable = true;
}
