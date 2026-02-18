{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      hyprlock
      jetbrains.idea
      hyprland
      antigravity
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      wayland
      wl-clipboard
      swww
      wofi
      rofi
      cliphist
      libnotify
      lxqt.lxqt-policykit

      #sql
      beekeeper-studio
      dbeaver-bin

      firefox-devedition
      ghostty
      alacritty
      tmux
      fish
      starship
      fzf
      jump
      bat
      tldr
      jq
      yq
      moreutils
      psmisc
      procps
      inotify-tools

      # File Management
      thunar
      tumbler
      ranger
      lf
      tree
      unrar
      unzip
      gnutar
      udisks
      udiskie
      parted
      gparted

      # System Monitoring & Tools
      htop
      btop
      atop
      pavucontrol
      brightnessctl
      gnome-system-monitor
      gnome-extension-manager
      gnome-tweaks
      font-manager
      man-pages
      glib

      # Graphics & Media
      feh
      imagemagick
      swappy
      grim
      slurp
      sway-contrib.grimshot
      kooha
      vlc
      mpv
      mpd
      mpdris2
      playerctl
      cava
      spotify
      gammastep

      # Networking
      git
      git-lfs
      wget
      httpie
      darkstat
      freeradius
      dig
      iftop
      mtr-gui
      mtr
      nethogs
      nload
      slurm-nm
      tcpdump
      wirelesstools
      iwgtk
      fastnetmon-advanced
      unixtools.netstat

      # Programming & Development
      python3
      go
      gopls
      nodejs
      typescript
      yarn
      jdk
      mono
      nuget
      nuget-to-json
      neovim
      tree-sitter
      ctags
      stylua

      llvmPackages_latest.lldb
      llvmPackages_latest.libllvm
      llvmPackages_latest.libcxx
      llvmPackages_latest.clang
      gcc
      gnumake
      cmakeCurses
      ninja
      pkg-config
      bear
      meson-tools
      include-what-you-use
      libtool
      gtest
      catch2
      boost
      doctest
      gcovr
      lcov
      valgrind
      heaptrack
      clang-analyzer
      cppcheck
      perf-tools
      systemtap-sdt
      cpplint
      clang-manpages
      doxygen
      natural-docs

      radare2
      binutils
      nchat

      # Databases
      pgcli
      libpq

      rzls
      icu
      xorg.xev
      xbanish
      delta
      gtk3
      stylua
      # ocaml
      # ocaml-top

      # Development utilities

      # cisco packet tracer
      /*
      #        (ciscoPacketTracer8.override {
       #      packetTracerSource = ../ciscoPacketTracer/CiscoPacketTracer822_amd64_signed.deb;
        #   })
      */

      /*
        disable waybar cuz noctalia-sehll seems better
         (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      }))
      */

      # add qml support for nixvim and add qml development facility
      qt6.qtbase
      qt6.qtdeclarative
      qt6.qttools
    ];

    variables = {
      PATH = "${pkgs.qt6.qtdeclarative}/bin:$PATH";
      QML_IMPORT_PATH = "${pkgs.qt6.qtdeclarative}/qml";
      QML2_IMPORT_PATH = "${pkgs.qt6.qtdeclarative}/qml";
      QT_PLUGIN_PATH = "${pkgs.qt6.qtbase}/lib/qt-6/plugins";
    };

    shellAliases = {
      qmlrun = "qml";
      qmlcheck = "qmlls --check";
      qmlfmt = "qmlformat --inplace";
    };

    extraOutputsToInstall = ["dev"];

    variables = {
      /*
      HTTP_PROXY = "http://127.0.0.1:8080";
      HTTPS_PROXY = "http://127.0.0.1:8080";
      FTP_PROXY = "http://127.0.0.1:8080";
      NO_PROXY = "127.0.0.1,localhost,*.local";
      http_proxy = "http://127.0.0.1:8080";
      https_proxy = "http://127.0.0.1:8080";
      ftp_proxy = "http://127.0.0.1:8080";
      */
      EDITOR = "nvim";
      C_include_PATH = "${pkgs.expat.dev}/include";
    };
    pathsToLink = ["/share/uwsm"];
  };
}
