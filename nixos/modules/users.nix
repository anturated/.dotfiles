{ pkgs, spicetifyPkgs, lib, ... }:

{
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" "docker" "input" "uinput"];
    shell = pkgs.fish;
  };

  # docker stuff
  virtualisation.docker.enable = true;
  systemd.services.docker.wantedBy = lib.mkForce []; # Don't start on boot
  systemd.sockets.docker.wantedBy = [ "sockets.target" ]; # Start the socket instead

  programs.spicetify = {
    enable = true;
    # theme = spicetifyPkgs.themes.comfy ;
  };
}
