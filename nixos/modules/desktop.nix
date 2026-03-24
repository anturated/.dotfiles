{ pkgs, config, lib, ... }:

{

  options.my.gpuProfile = lib.mkOption {
    type = lib.types.enum [ "amd" "nvidia" ];
    default = "nvidia";
    description = "Currently used for prime. Points wayland to the right driver/lib.";
  };

  config = {
    services.xserver.enable = false;
    services.xserver.videoDrivers = [ "nvidia" ];

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
          user = "desant";
        };
        initial_session = {
          command = "Hyprland";
          user = "desant";
        };
      };
    };

    programs.fish.enable = true;
    programs.hyprland.enable = true;

    # enable wayland support on electron and other stuff
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

	  programs.steam = {
  	  enable = true;
  	  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  	  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	  };

    # feral gamemode
	  programs.gamemode.enable = true;

	  programs.gpu-screen-recorder.enable = true;

    # TODO: doesnt work probably
	  qt.enable = true;
	  qt.platformTheme = "qt5ct";

	    # To prevent getting stuck at shutdown
    # systemd.extraConfig = ''
    #   DefaultTimeoutStopSec=5s
    # '';
    #
    # systemd.user.extraConfig = ''
    #   DefaultTimeoutStopSec=5s
    # '';
    };
}

