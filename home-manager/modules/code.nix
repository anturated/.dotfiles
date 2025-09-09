
{ pkgs, ... }:

{
  home.packages = [
    pkgs.nodejs_24
    pkgs.rustc
    pkgs.cargo
    pkgs.gcc
  ];
}
