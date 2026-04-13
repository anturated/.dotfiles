{ pkgs, config, ... }:

{
  # kernel modules
  boot = {
    # download
    extraModulePackages = [ config.boot.kernelPackages.lenovo-legion-module ];
    # enable
    kernelModules = [ "lenovo_legion" ];
  };
  # userspace gui
  environment.systemPackages = with pkgs; [
    lenovo-legion
  ];
}
