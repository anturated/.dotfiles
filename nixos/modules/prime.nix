{ pkgs, config, ... }:

{
  # NOTE:
  # we use sync currently
  # because hyprland won't render without NVIDIA GPU
  # which may or may not have been fixed with card linking + priorities
  # TODO: check if offload will make the dGPU power down
  config = {

    # enable prime offload on the gpu
    hardware.nvidia.prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      sync.enable = false;

      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    # NOTE: didnt try might help
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

    my.gpuProfile = "amd";

    environment.systemPackages = with pkgs; [
      mesa
    ];
  };
}
