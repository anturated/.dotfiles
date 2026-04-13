{ pkgs, config, ... }:

{
  hardware = {
    enableAllFirmware = true;

	  bluetooth = {
  	  enable = true;
  	  powerOnBoot = true;
  	  settings = {
    	  General = {
      	  # Shows battery charge
      	  Experimental = true;
      	  # Faster connect, more power drain
      	  FastConnectable = true;
          DisableAbsoluteVolume = true;
    	  };
    	  Policy = {
      	  # Enable all controllers when they are found.
      	  AutoEnable = true;
    	  };
  	  };
    };

    nvidia = {
      # sleep fix
      powerManagement.enable = true;
      # power saving?
      powerManagement.finegrained = true;

      # driver version
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;

      # required by wayland... and everything else
      modesetting.enable = true;
    };

    # hardware acceleration stuff (should be enabled by the driver but eh)
    graphics.enable = true;
    graphics.enable32Bit = true;

    steam-hardware.enable = true;
  };

  # udev rules to symlink cards and avoid random switches
  services.udev.extraRules = ''
    # AMD iGPU
    KERNEL=="card*", \
    KERNELS=="0000:06:00.0", \
    SUBSYSTEM=="drm", \
    SUBSYSTEMS=="pci", \
    SYMLINK+="dri/amd-igpu"

    # NVIDIA dGPU
    KERNEL=="card*", \
    KERNELS=="0000:01:00.0", \
    SUBSYSTEM=="drm", \
    SUBSYSTEMS=="pci", \
    SYMLINK+="dri/nvidia-dgpu"
  '';

  # bluetooth fix (i honestly have no idea why it refuses to work)
  systemd.services.unblock-bluetooth = {
    description = "Unblock Bluetooth on startup";
    wantedBy = [ "multi-user.target" ];
    after = [ "bluetooth.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
      RemainAfterExit = true;
    };
  };
}
