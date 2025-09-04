{ pkgs, ... }:

{
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    nerd-fonts.meslo-lg
    material-symbols
    monaspace
    maple-mono.NL-CN
    iosevka
  ];
}
