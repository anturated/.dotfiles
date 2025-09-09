{ pkgs, ... }:

{
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  programs.thunar.enable = true;
}
