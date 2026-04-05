{ pkgs, ... }:

{
  home.packages = with pkgs; [
    darkly-qt5 
    darkly
  ];
}
