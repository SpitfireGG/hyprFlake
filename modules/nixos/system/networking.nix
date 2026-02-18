{...}: {
  networking = {
    networkmanager.enable = true;
    wireless.driver = "ath9k";
    hostName = "archbishop";
    useDHCP = false;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "8.8.8.8"
    ];

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };
}
