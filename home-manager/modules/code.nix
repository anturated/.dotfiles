{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # nodejs_24
    # rustc
    # cargo
    # gcc
    # python3
    #
    # omnisharp-roslyn
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      pkgs.dotnet-sdk_9
      pkgs.dotnet-runtime_9
      pkgs.omnisharp-roslyn
    ]);
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };
}
