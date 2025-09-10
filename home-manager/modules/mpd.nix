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
  };

  home.packages = [
    pkgs.ncmpcpp
    pkgs.mpd-mpris
  ];

  # TODO: there is a dedicated service for mpd-mpris
  # i don't know how to start it
  # systemd.user.services.mpd-mpris.enable = true; # this doesnt work
  # rn its started in ../../hypr/components/autostart.conf
  # we probably don't want that

}
