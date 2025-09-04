{ config, pkgs, ... }:

{
  imports = [
    # TODO: idk how modules work yet
    ./modules/desktop.nix
    ./modules/fonts.nix
    ./modules/hardware.nix
    ./modules/services.nix
    ./modules/users.nix
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

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

  time.timeZone = "Europe/Warsaw";
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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.stateVersion = "25.05"; # DONT CHANGE

}
