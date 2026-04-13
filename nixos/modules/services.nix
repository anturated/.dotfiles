{ pkgs, ... }:

{
  # for widgets likely
  services.upower.enable = true;
  services.udisks2.enable = true;
  # services.power-profiles-daemon.enable = true;
  services.tlp = {
    enable = true;
    settings = {
      # When plugged in or forced via 'tlp ac'
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # When on battery (This kills the lag!)
      CPU_SCALING_GOVERNOR_ON_BAT = "schedutil"; 
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      # Legion specific: Keep the brick cool when not gaming
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
    };
  };

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
