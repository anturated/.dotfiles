{ config, pkgs, ... }:

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

  services.udisks2.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  services.mpd = {
    enable = true;
    musicDirectory = "/home/desant/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipe"
      }
    '';
    # server "127.0.0.1"
    # network.listenAddress = "127.0.0.1";
    startWhenNeeded = true;
    user = "desant";
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.desant.uid}";
  };

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };

  # services.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  # services.pulseaudio.systemWide = true;

}
