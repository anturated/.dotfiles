{ pkgs, ... }:

{
  services.upower.enable = true;
  services.udisks2.enable = true;

  # need this for gpg signing
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  services.openvpn.servers = {
    ukraineVPN = {
      config = '' config /home/desant/Downloads/uaVPN.ovpn '';
      autoStart = false;
    }; 
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  programs.nix-ld.enable = true;

  services.ratbagd.enable = true;
}
