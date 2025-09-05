{ config, pkgs, ... }:

{
  services.xserver.enable = false;
  services.xserver.videoDrivers = ["nvidia"];
  services.xserver.displayManager.gdm.enable = true;

  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;

  programs.fish.enable = true;
  programs.hyprland.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

	programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  	localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};

	programs.gamemode.enable = true;
}
