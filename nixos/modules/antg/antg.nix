{ pkgs, ... }:

{
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "antg" ''
      #!/usr/bin/env bash

      # defaults
      USE_HYPR=0
      USE_OFFLOAD=0
      USE_GAMEMODE=0
      USE_GAMEMODE_DAEMON=0
      USE_MANGOHUD=0

      # check flags
      FLAGS_SET=0
      while getopts ":hogGm" opt; do
        FLAGS_SET=1
        case $opt in
          h) USE_HYPR=1 ;;
          o) USE_OFFLOAD=1 ;;
          g) USE_GAMEMODE=1 ;;
          G) USE_GAMEMODE_DAEMON=1 ;;
          m) USE_MANGOHUD=1 ;;
          *) ;;
        esac
      done
      shift $((OPTIND -1))

      # if no flags apply defaults
      if [ $FLAGS_SET -eq 0 ]; then
        USE_HYPR=1
        USE_OFFLOAD=1
        USE_GAMEMODE=1
      fi

      # cleanup trap
      GM_PID=""
      cleanup() {
        if [ -n "$GM_PID" ]; then
          kill "$GM_PID" 2>/dev/null || true
        fi
        if [ $USE_HYPR -eq 1 ]; then
          ${pkgs.hyprland}/bin/hyprctl reload
        fi
      }
      trap cleanup EXIT

      # remove hyprland beauty in favor of the frames
      if [ $USE_HYPR -eq 1 ]; then
        ${pkgs.hyprland}/bin/hyprctl keyword animations:enabled 0
        ${pkgs.hyprland}/bin/hyprctl keyword decoration:blur:enabled 0
        ${pkgs.hyprland}/bin/hyprctl keyword render:direct_scanout 1
      fi

      # pop a gamemode daemon (nightreign stare)
      if [ $USE_GAMEMODE_DAEMON -eq 1 ]; then
        ${pkgs.gamemode}/bin/gamemoded -r &
        GM_PID=$!
      fi

      # assemble
      CMD=("$@")
      if [ $USE_OFFLOAD -eq 1 ]; then
        CMD=(env __NV_PRIME_RENDER_OFFLOAD=1 __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only "''${CMD[@]}")
      fi
      if [ $USE_MANGOHUD -eq 1 ]; then
        CMD=(${pkgs.mangohud}/bin/mangohud "''${CMD[@]}")
      fi
      if [ $USE_GAMEMODE -eq 1 ]; then
        CMD=(${pkgs.gamemode}/bin/gamemoderun "''${CMD[@]}")
      fi

      # run
      "''${CMD[@]}"
      exit $?
    '')
  ];
}
