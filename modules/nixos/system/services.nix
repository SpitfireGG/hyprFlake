{pkgs, ...}: {
  services.displayManager.sddm.enable = false;
  services = {
    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --remember --user-menu --greeting 'Welcome back' --cmd start-hyprland";
          user = "archbishop";
        };
      };
    };
    upower.enable = true;
    power-profiles-daemon.enable = true;
    xserver = {
      enable = false;
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
        GRANT ALL PRIVILEGES ON DATABASE archdb TO archbishop;
        GRANT ALL PRIVILEGES ON DATABASE postgres TO archbishop;
        \connect archdb
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
      # Low-latency audio config
      extraConfig.pipewire."92-low-latency" = {
        context.properties = {
          default.clock.rate = 48000;
          default.clock.quantum = 512;
          default.clock.min-quantum = 32;
          default.clock.max-quantum = 8192;
        };
      };
    };
  };
}
