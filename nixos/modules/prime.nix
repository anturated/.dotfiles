{ pkgs, config, ... }:

{
  config = {

    # enable prime offload on the gpu
    hardware.nvidia.prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      sync.enable = false;

      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    # no idea what this does
    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
    hardware.nvidia.powerManagement.finegrained = true;

    # hardware acceleration stuff
    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;

    # brightness fix kinda
    boot.kernelParams = [
      "video.use_native_backlight=1"
    ];

    # iGPU drivers
    services.xserver.videoDrivers = [ "modesetting" "amdgpu" ];

    # should speed up the boot
    boot.initrd.kernelModules = [
      "amdgpu"
    ];

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

    # internal flag to know we are in prime
    my.gpuProfile = "amd";
  };
}
