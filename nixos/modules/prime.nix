{ pkgs, ... }:

{

  # enable prime offload on the gpu
  hardware.nvidia.prime = {
    offload.enable = true;
    offload.enableOffloadCmd = true;

    amdgpuBusId = "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  # NOTE: didnt try might help
  #
  # hardware.nvidia.powerManagement.finegrained = true;

  # hardware acceleration stuff
  graphics.enable = true;
  graphics.enable32Bit = true;

  # brightness fix kinda
  boot.kernelParams = [
    "video.use_native_backlight=1"
  ];

  # iGPU drivers
  services.xserver.videoDrivers = [ "amdgpu" ];

  # this is supposed to make hyprland start on the iGPU
  environment.variables = {
    WLR_DRM_DEVICES = "/dev/dri/by-path/pci-0000:06:00.0-card";
  };
  services.udev.extraRules = ''
    # Rule to force GDM to use the integrated AMD GPU.
    # It identifies the AMD card by its vendor ID and sets it as primary.
    SUBSYSTEM=="drm", KERNEL=="card*", ATTRS{vendor}=="0x1002", ENV{GDM_PRIMARY_GPU}="1"

    # FROM ARCHWIKI
    # Enable runtime PM for NVIDIA VGA/3D controller devices on driver bind
    ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
    ACTION=="bind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"

    # Disable runtime PM for NVIDIA VGA/3D controller devices on driver unbind
    ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="on"
    ACTION=="unbind", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="on"

    # Enable runtime PM for NVIDIA VGA/3D controller devices on adding device
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030000", TEST=="power/control", ATTR{power/control}="auto"
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x030200", TEST=="power/control", ATTR{power/control}="auto"
  '';

  users.users.desant.packages = with pkgs; [
    lshw
    xorg.xrandr
    # mesa-demos
  ];

}
