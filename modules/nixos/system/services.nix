{pkgs, ...}: {
  services = {
    xserver = {
      displayManager.lightdm.enable = false;
      displayManager.autoLogin.enable = false;
      videoDrivers = ["nvidia"];
      enable = false;
      dpi = 106;
      xkb.layout = "us";
    };
    getty.autologinUser = "archbishop";
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
        #type    database   DBuser  auth-method
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
    displayManager = {
      defaultSession = "hyprland"; # Ensure Hyprland is the default session
      sddm = {
        enable = false; # Enable SDDM
        wayland.enable = true; # Enable Wayland support (sets DisplayServer=wayland)

        enableHidpi = true;
        package = pkgs.kdePackages.sddm;

        autoNumlock = false; # Or set via settings.General.Numlock = "none";

        wayland.compositorCommand = "${pkgs.hyprland}/bin/Hyprland";

        theme = "sddm-astronaut-theme";

        settings = {
          General = {
            Numlock = "none"; # Explicitly set Numlock off here if not using autoNumlock option
          };
        };
      }; # End of sddm attrset
    };
    blueman.enable = true;
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        middleEmulation = true;
        naturalScrolling = true;
      };
    };

    /*
    gnome.gnome-keyring.enable = true;
    gnome.tinysparql.enable = true;
    gnome.localsearch.enable = true;
    */
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

  # Install the custom theme
  /*
  environment.systemPackages = [
    (import ../../../archbishop/conf/ui/sddm.nix {inherit pkgs;})
  ];

  # Configure SDDM to use black_hole variant
  environment.etc."sddm.conf.d/astronaut-theme.conf".text = ''
    [Theme]
    Current=sddm-astronaut-theme
    ThemeDir=/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/
    ConfigFile=/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/Themes/japanese_aesthetic.conf
      ConfigFile=/run/current-system/sw/share/sddm/themes/sddm-astronaut-theme/Themes/japanese_aesthetic.conf
  '';
  */
}
