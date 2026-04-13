{ config, pkgs, ... }:

{
  config = {
    # no idea
    services.xserver.enable = false;
    services.xserver.videoDrivers = [ "nvidia" ];

    # quick(?) autologin
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd start-hyprland";
          user = "desant";
        };
        initial_session = {
          command = "start-hyprland";
          user = "desant";
        };
      };
    };

    # hyprland
    programs.hyprland.enable = true;

    # enable wayland support on electron and other stuff
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    # TODO: doesnt work probably
	  qt.enable = true;
	  qt.platformTheme = "qt5ct";

    environment.systemPackages = with pkgs; [
      # i'm not using nano
      neovim
      # need terminal
      kitty
      # app launcher for good measure
      rofi
      # ui for root permission (a lot of apps want a polkit)
      lxqt.lxqt-policykit
    ];
  };
}
