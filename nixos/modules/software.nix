{ pkgs, config, spicetifyPkgs, lib, ... }:

{
  # the one and only shell
  programs.fish.enable = true;

  # basic bs, might as well just get it
  environment.systemPackages = with pkgs; [
    wget
    curl
    git
    home-manager
  ];

  # spicetify
  # NOTE: no idea if i can move that to home-manager
  programs.spicetify = {
    enable = true;
    # theme = spicetifyPkgs.themes.comfy ;
  };

  # docker stuff
  virtualisation.docker.enable = true;
  systemd.services.docker.wantedBy = lib.mkForce []; # Don't start on boot
  systemd.sockets.docker.wantedBy = [ "sockets.target" ]; # Start the socket instead
}
