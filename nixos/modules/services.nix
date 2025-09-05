{ pkgs, ... }:

{
  services.upower.enable = true;

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
}
