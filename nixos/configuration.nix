# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.upower.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vivaldi telegram-desktop vesktop
      starship zoxide thefuck
      yazi hyprshot btop lazygit fzf ripgrep gdu matugen gh ttyper kdePackages.kate
      nodejs_24 rustup
      killall eza bat fastfetch
			brightnessctl playerctl bluetui pavucontrol
			nautilus seahorse cava
			lenovo-legion
			pinentry
    ];
    shell = pkgs.fish;
  };

  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    material-symbols
    monaspace
    maple-mono.NL-CN
    iosevka
  ];

	programs.steam = {
  	enable = true;
  	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  	localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
	};
	programs.gamemode.enable = true;

	services.spotifyd = {
	  enable = true;
	};

	# services.blueman.enable = true;
	hardware.bluetooth = {
  	enable = true;
  	powerOnBoot = true;
  	settings = {
    	General = {
      	# Shows battery charge of connected devices on supported
      	# Bluetooth adapters. Defaults to 'false'.
      	Experimental = true;
      	# When enabled other devices can connect faster to us, however
      	# the tradeoff is increased power consumption. Defaults to
      	# 'false'.
      	FastConnectable = true;
    	};
    	Policy = {
      	# Enable all controllers when they are found. This includes
      	# adapters present on start as well as adapters that are plugged
      	# in later on. Defaults to 'true'.
      	AutoEnable = true;
    	};
  	};
  };

  hardware.xone.enable = true;


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget curl
    neovim
    kitty
    rofi
    git
    # this for quickshell
    kdePackages.qt5compat
    kdePackages.qtimageformats
    kdePackages.qtmultimedia
    kdePackages.qtsvg
  ];

  services.xserver.enable = false;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # TODO: do we even need this?
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "gtk-2";
    pinentryPackage = pkgs.pinentry-curses;
  };


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
