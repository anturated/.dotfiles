{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;

    # where music
    musicDirectory = "/home/desant/Music";

    # we use pipewire right?
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "pipe"
      }
    '';
    # NOTE: the below is probably a snippet from the above config
    # idk what it does
    #
    # server "127.0.0.1"
    # network.listenAddress = "127.0.0.1";

    # start when requested
    startWhenNeeded = true;

    # run as user
    user = "desant";
  };

  # probably some user bs
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.desant.uid}";
  };

  # PIPEWIRE UN-ISOLATION BS
  # rtkit is optional but recommended
  security.rtkit.enable = true;

  # pipewire config
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # TODO: do we need this
  # services.pulseaudio.extraConfig = "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1";
  # services.pulseaudio.systemWide = true;

  users.users.desant.packages = with pkgs; [
    mpd # TODO: do we need this

    mpc # mpd cli frontend
    ncmpcpp
    ario # mpd gtk frontend
  ];

}
