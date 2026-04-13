{ pkgs, ... }:
{
  nix = {
    settings = {
      substituters = [
        "https://cache.nixos.org?priority=1"

        "https://nix-community.cachix.org?priority=2"

        "https://numtide.cachix.org?priority=3"

        "https://hyprland.cachix.org?priority=4"

        "https://nixpkgs-wayland.cachix.org?priority=5"

        "https://devenv.cachix.org?priority=6"

        "https://nix-gaming.cachix.org?priority=7"

        "https://cache.nixos-cuda.org?priority=8"

      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="

        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="

        "numtide.cachix.org-1:2ps1kLBUWjxIneOy1Ik6cQjb41X0iXVXeHigGmycPPE="

        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="

        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="

        "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="

        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="

        "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      ];

      max-jobs = "auto";
      cores = 0;

      auto-optimise-store = true;

      connect-timeout = 5;

      http-connections = 128;

      fallback = true;

      keep-outputs = true;
      keep-derivations = true;

      experimental-features = [
        "nix-command"
        "flakes"
      ];

      warn-dirty = false;

      trusted-users = [
        "root"
        "@wheel"
      ];
    };

    package = pkgs.nixVersions.latest;

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";

      persistent = true;
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };
}
