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
  };
}
