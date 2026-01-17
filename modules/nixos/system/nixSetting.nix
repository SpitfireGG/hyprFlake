{pkgs, ...}: {
  nix = {
    settings.substituters = ["https://aseipp-nix-cache.global.ssl.fastly.net"];
    binaryCaches = ["https://cache.nixos.org"];
    binaryCachePublicKeys = ["cache.nixos.org-1:6aveZ/3/TfB+C6fL6vXpM9xIu+T8n1d+v3uL7vW/Wz0="];
    package = pkgs.nixVersions.latest;
    buildMachines = [
      {
        hostName = "archbishop";
        system = "x86_64-linux"; # Or your system
        maxJobs = 8;
      }
    ];
    settings = {
      max-jobs = 8;
      cores = 4;
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      keep-outputs = true;
      keep-derivations = true;
      warn-dirty = true;
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 4d";
    };
    optimise.automatic = true;
  };
}
