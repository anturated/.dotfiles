{ pkgs, ... }:

{
  services.upower.enable = true;

	services.spotifyd = {
	  enable = true;
	};

  # TODO: do we even need this?
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };
}
