{ config, pkgs, ... }:

{
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vivaldi telegram-desktop vesktop
      starship zoxide thefuck
      yazi hyprshot btop lazygit fzf ripgrep gdu matugen gh ttyper kdePackages.kate
      nodejs_24 rustup
      killall eza bat fastfetch
			brightnessctl playerctl bluetui pavucontrol
			nautilus seahorse cava anytype
			lenovo-legion
			pinentry
    ];
    shell = pkgs.fish;
  };
}
