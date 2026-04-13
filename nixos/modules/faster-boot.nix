{ ... }:

{
  boot = {
    # compress initramfs (no idea how it helps but ok)
    initrd.compressor = "zstd";
    # load graphics fast
    initrd.kernelModules = [
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
  };

  # don't wait for online
  systemd.services.NetworkManager-wait-online.enable = false;
}
