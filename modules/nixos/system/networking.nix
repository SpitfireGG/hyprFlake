{pkgs, ...}: {
  networking = {
    networkmanager.enable = true;
    wireless.driver = "ath9k";
    hostName = "archbishop";
    useDHCP = false;
  };
  /*
     environment.systemPackages = with pkgs; [
    tinyproxy # Lightweight HTTP proxy
    privoxy # Privacy-focused HTTP proxy

    # SOCKS proxies
    dante # SOCKS server
    shadowsocks-libev

    # Proxy chains and tools
    proxychains-ng # Chain multiple proxies
    tsocks # Transparent SOCKS proxy
    redsocks # Transparent TCP-to-SOCKS redirector

    # Testing and debugging
    curl
    wget
    nmap
    netcat-gnu
    tcpdump
    wireshark
  ];
  services.tinyproxy = {
    enable = true;
  };
  environment.etc = {
    "tinyproxy/tinyproxy.conf".text = ''
      Port 8080
      Listen 127.0.0.1
      Timeout 600
      LogLevel Info
      MaxClients 100

      # Allow local connections
      Allow 127.0.0.1

      # Anonymous headers (if needed)
      Anonymous "Host"
      Anonymous "Authorization"
      Anonymous "User-Agent"
      Anonymous "Referer"
      Anonymous "Cookie"
      Anonymous "X-Forwarded-For"
      Anonymous "Via"
    '';
    "proxychains.conf".text = ''
      strict_chain
      proxy_dns
      remote_dns_subnet 224
      tcp_read_time_out 15000
      tcp_connect_time_out 8000

      [ProxyList]
      http  127.0.0.1 8080
    '';
  };
  */
}
