# overlays/default.nix
self: super: {
  # Define a package for the sddm-astronaut-theme
  sddm-theme-astronaut = super.stdenv.mkDerivation {
    pname = "sddm-theme-astronaut";
    version = "unstable-2024-04-22"; # Or use a recent commit date

    # Fetch the source code from GitHub
    src = super.fetchFromGitHub {
      owner = "keyitdev"; # The owner of the sddm-astronaut-theme repo
      repo = "sddm-astronaut-theme";
      rev = "a0b324611e6d661a1d3341216b31692650546675"; # A recent commit hash
      # Get this hash by checking the commit history on GitHub or by running
      # `nix-prefetch-url <github_tarball_url>` for the commit/tag.
      # Alternatively, let `nixos-rebuild` fail, and it will tell you the hash.
      sha256 =
        "sha256-fWqS60604G+T4yU2q+4XlE3E6yE2q+4XlE3E6yE2q+4XlE3"; # REPLACE WITH ACTUAL HASH
      # Use `nix-prefetch-url --unpack <github_tarball_url_for_rev>`
      # or `nix-store --query --hash /nix/store/...-sddm-theme-astronaut-...` after a failed build.
    };

    # Install phase: Copy the theme directory to the correct SDDM themes location
    # The theme directory name within the repo is 'astronaut'
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -r $src $out/share/sddm/themes/astronaut
    '';

    # No build needed for simple file copying
    dontBuild = true;
  };
}
