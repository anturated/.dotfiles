{ pkgs, spicetifyPkgs, ... }:

{
  users.users.desant = {
    isNormalUser = true;
    description = "Desant";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
  };

  # docker stuff
  virtualisation.docker = {
    enable = true;
  };

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicetifyPkgs.extensions; [
      keyboardShortcut
    ];

    theme = spicetifyPkgs.themes.comfy ;
  };
}
