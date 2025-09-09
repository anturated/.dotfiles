{
  description = "NixOS config flake thing";

  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, quickshell, nixos-hardware, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [ 
        ./configuration.nix 

        {
          environment.systemPackages = [ quickshell.packages.x86_64-linux.default ];
        }

        nixos-hardware.nixosModules.lenovo-legion-15arh05h
      ];
    };
  };
}

