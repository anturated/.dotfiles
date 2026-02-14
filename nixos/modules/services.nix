{ pkgs, ... }:

{
  services.upower.enable = true;
  services.udisks2.enable = true;

  # need this for gpg signing
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
  };

  services.openvpn.servers = {
    ukraineVPN = {
      config = '' config /home/desant/Downloads/uaVPN.ovpn '';
      autoStart = false;
    }; 
  };

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;

  programs.nix-ld.enable = true;
  # services.udev.extraRules = ''
  #   # 8BitDo Ultimate 2 Dongle
  #   KERNEL=="hidraw*", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310a", MODE="066" 
  #
  #   # 8BitDo Ultimate 2 BT
  #   KERNEL=="hidraw*", KERNELS=="*2DC8:310B*", MODE="0660", TAG+="uaccess"
  #
  #   # Force xpad driver for 8BitDo Ultimate 2C (2.4 GHz dongle)
  #   ACTION=="add", ATTRS{idVendor}=="2dc8", ATTRS{idProduct}=="310a", \
  #     RUN+="/sbin/modprobe xpad", \
  #     RUN+="/bin/sh -c 'echo 2dc8 310a > /sys/bus/usb/drivers/xpad/new_id'"
  # '';

  # services.input-remapper.enable = true;
}
