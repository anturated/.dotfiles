{ pkgs, services, ... }:

let
  pythonEnv = pkgs.python3.withPackages (ps: with ps; [
    dbus-python
    pygobject3
  ]);

  antDaemon = pkgs.writeTextFile {
    name = "antd.py";
    destination = "/bin/antd.py";
    executable = true;
    text = ''
      #!${pythonEnv}/bin/python3
      import dbus
      import dbus.service
      import dbus.mainloop.glib
      from gi.repository import GLib
      import subprocess

      class AntDaemon(dbus.service.Object):
          def __init__(self):
              bus_name = dbus.service.BusName('com.anturated.antd', bus=dbus.SystemBus())
              dbus.service.Object.__init__(self, bus_name, '/com/anturated/antd')
              self.clients = set()
              print("[antd] TLP Daemon started...")

          def update_tlp(self):
              if len(self.clients) > 0:
                  print(f"[antd] Active clients: {len(self.clients)}. Setting TLP to AC.")
                  subprocess.run(["${pkgs.tlp}/bin/tlp", "ac"])
              else:
                  print("[antd] No active clients. Setting TLP to BAT.")
                  subprocess.run(["${pkgs.tlp}/bin/tlp", "bat"])

          @dbus.service.method('com.anturated.antd', in_signature='i')
          def RegisterClient(self, pid):
              self.clients.add(pid)
              self.update_tlp()
              return f"[antd] Registered {pid}"

          @dbus.service.method('com.anturated.antd', in_signature='i')
          def UnregisterClient(self, pid):
              if pid in self.clients:
                  self.clients.remove(pid)
              self.update_tlp()
              return f"[antd] Unregistered {pid}"

      dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
      daemon = AntDaemon()
      loop = GLib.MainLoop()
      loop.run()
    '';
  };
in
{
  # 1. The D-Bus Policy (Allows users to talk to the daemon)
  services.dbus.packages = [
    (pkgs.writeTextFile {
      name = "antd-dbus-conf";
      destination = "/share/dbus-1/system.d/com.anturated.antd.conf";
      text = ''
        <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
         "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
        <busconfig>
          <policy user="root">
            <allow own="com.anturated.antd"/>
          </policy>
          <policy context="default">
            <allow send_destination="com.anturated.antd"/>
          </policy>
        </busconfig>
      '';
    })
  ];

  # 2. The Background Service
  systemd.services.antd = {
    description = "Daemon for TLP bs to use with antg";
    after = [ "dbus.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${antDaemon}/bin/antd.py";
      Restart = "always";
    };
  };
}
