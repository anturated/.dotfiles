{ pkgs, ... }:

{
  # for widgets likely
  services.upower.enable = true;
  services.udisks2.enable = true;

  # need this for gpg signing
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  # keyring
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  # file structure normalifyer
  programs.nix-ld.enable = true;

  # mouse settings
  services.ratbagd.enable = true;
}
