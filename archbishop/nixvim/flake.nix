{
  description = "A nixvim configuration with custom plugins";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};

        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        configModule = {
          lib,
          config,
          pkgs,
          ...
        }: (import ./config {
          inherit
            inputs
            lib
            config
            pkgs
            ;
        });
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = configModule;
        };
      in {
        formatter = pkgs.nixpkgs-fmt;
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNvim {
            inherit nvim;
            name = "My nixvim configuration";
          };
        };
        packages = {
          default = nvim;
        };
        devShells.default = import ./shell.nix {
          inherit pkgs;
        };
      }
    );
}
