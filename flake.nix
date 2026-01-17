{
  description = "archbishop personal flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hm = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    quickshell = {
      url = "github:quickshell-mirror/quickshell"; # ← ADD THIS
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    hm,
    nixvim,
    ...
  } @ inputs: {
    nixosConfigurations = {
      archbishop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/dell/configuration.nix
          #     ./modules/packetTracerByp.nix
        ];
      };
    };
    homeConfigurations = {
      archbishop = hm.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config = {
            allowUnfree = true;
          };
        };
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./archbishop/home.nix
          nixvim.homeModules.nixvim
        ];
      };
    };
    archbishop = self.nixosConfigurations.archbishop.config.system.build.toplevel;
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
