{pkgs, ...}: {
  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    tor = {
      enable = false;
      openFirewall = true;
      relay = {
        enable = true;
        role = "relay";
      };
      settings = {
        ContactInfo = "";
        Nickname = "archb";
        ORPort = 9001;
        ControlPort = 9051;
        BandWidthRate = "1 MBytes";
      };
    };
    displayManager = {
      ly = {
        enable = true;
      };
    };
    postgresql = {
      enable = true;
      ensureDatabases = ["archdb"];
      authentication = pkgs.lib.mkOverride 10 ''

        local       all       all     trust
        host        all         all     127.0.0.1/32 md5
        host        all         all     ::1/128 md5
      '';
      initialScript = pkgs.writeText "backend-initScript" ''
        CREATE ROLE archbishop WITH LOGIN PASSWORD 'GG' CREATEDB;
        GRANT ALL PRIVILIGES ON DATABASE archdb TO archbishop;
        GRANT ALL PRIVILIGES ON DATABASE postgres TO archbishop;
        \ connect archdb
        GRANT ALL ON SCHEMA public TO archbishop;
      '';
      settings = {
        port = 3232;
      };
    };
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    fwupd.enable = true;
    blueman.enable = false;
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        middleEmulation = true;
        naturalScrolling = true;
      };
    };

    gnome.gnome-keyring.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    udisks2.enable = true;
    tlp.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  /*
  environment.systemPackages = [
    (import ../../../archbishop/conf/ui/sddm.nix {inherit pkgs;})
  ];

  environment.etc."sddm.conf.d/astronaut-theme.conf".text = ''
    [Theme]
    Current=sddm-astronaut-theme
    ThemeDir=/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/
    ConfigFile=/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/Themes/japanese_aesthetic.conf
      ConfigFile=/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/Themes/japanese_aesthetic.conf
  '';
  */
}
