{ pkgs, config, ... }:

{
  # NOTE:
  # right now if you fully offload (i think)
  # hyprland via some of the env vars commented
  # nvidia gpu, which it can't. and thus
  # it doesnt render. but works. but i can't see it
  # maybe when we figure that out the dGPU will
  # actually power down.

  config = {

    # enable prime offload on the gpu
    hardware.nvidia.prime = {
      offload.enable = false;
      sync.enable = true;

      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;

    # NOTE: didnt try might help
    # hardware.nvidia.powerManagement.finegrained = true;

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

    # NOTE: this doesnt really help i dont think
    # services.udev.extraRules = ''
    #   # Rule to force GDM to use the integrated AMD GPU.
    #   # It identifies the AMD card by its vendor ID and sets it as primary.
    #   # SUBSYSTEM=="drm", KERNEL=="card*", ATTRS{vendor}=="0x1002", ENV{GDM_PRIMARY_GPU}="1"
    #
    #   # FROM ARCHWIKI
    #   # Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
    #   ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
    #   ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"
    #
    #   # Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
    #   ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="on"
    #   ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="on"
    #
    #   # Enable runtime PM for NVIDIA VGA/3D controller devices on adding device
    #   ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
    #   ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"
    # '';

    environment.systemPackages = with pkgs; [
      mesa
    ];
  };

  # users.users.desant.packages = with pkgs; [ ];

}
