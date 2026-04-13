{ pkgs, ... }:

{
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" "docker" "input" "uinput" "gamemode" ];
    shell = pkgs.fish;
  };
}
