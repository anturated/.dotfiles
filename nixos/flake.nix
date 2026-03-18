{
  description = "NixOS config flake thing";

  inputs = {
    # Use `nix flake update` to update the flake to the latest revision of the chosen release channel.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = { nixpkgs, nixos-hardware, spicetify-nix, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {

      modules = [ 
        ./configuration.nix 

        nixos-hardware.nixosModules.lenovo-legion-15arh05h
        spicetify-nix.nixosModules.default
        { _module.args.spicetifyPkgs = spicetify-nix.legacyPackages.x86_64-linux; }
      ];
    };
  };
}

