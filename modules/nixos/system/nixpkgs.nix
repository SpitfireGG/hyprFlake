{
  nixpkgs = {
    config = {
      permittedInsecurePackages = [
        "unrar"
        "electron-12.2.3"
        "openssl-1.1.1v"
        "python-2.7.18.6"
        "nodejs-14.21.3"
        "spotify"
        "discord"
        "openssl-1.1.1w"
        "libxml2-2.13.8"
        "beekeeper-studio-5.5.3"
        "ciscoPacketTracer8-8.2.2"
        "beekeeper-studio-5.3.4"
        "idea-2025.3.2"
      ];
    };
    config.allowUnfree = true;
    config.input-fonts.acceptLicense = true;
  };
}
