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
    # services.xserver.displayManager.gdm.enable = true;
    services.displayManager.gdm.enable=true;

    programs.fish.enable = true;
    programs.hyprland.enable = true;

    # enable wayland support on electron and other stuff
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # env vars for hypr based on gpu

    environment.variables = 
    if config.my.gpuProfile == "amd" then {
      # make it start on the right gpu
      WLR_DRM_DEVICES = "/dev/dri/card1";
      AQ_DRM_DEVICES = "/dev/dri/card1";

      # idk
      LIBVA_DRIVER_NAME = "amdgpu";
      # __GLX_VENDOR_LIBRARY_NAME = "amdgpu";
      __GLX_VENDOR_LIBRARY_NAME = "mesa";

      # Only AMD/Intel Vulkan ICD visible by default
      VK_ICD_FILENAMES = "${pkgs.mesa}/share/vulkan/icd.d/radeon_icd.x86_64.json";
      VK_LAYER_PATH = "${pkgs.mesa}/share/vulkan/explicit_layer.d";


      # this is supposed to make hyprland start on the iGPU
      # __GLX_VENDOR_LIBRARY_NAME="mesa";
      # __EGL_VENDOR_LIBRARY_FILENAMES="/usr/share/glvnd/egl_vendor.d/50_mesa.json";
    } else {
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };

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

