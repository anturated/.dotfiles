{ ... }:

{
  home.username = "desant";
  home.homeDirectory = "/home/desant";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/basic.nix
    ./modules/cli.nix
    ./modules/code.nix
    ./modules/util.nix
    ./modules/gaming.nix
    ./modules/mpd.nix
  ];

  home.stateVersion = "25.05";
}
