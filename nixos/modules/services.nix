{ pkgs, ... }:

{
  services.upower.enable = true;
  services.udisks2.enable = true;

  # need this for gpg signing
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  programs.nix-ld.enable = true;

  services.ratbagd.enable = true;
}
