{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      xdg-desktop-portal-hyprland

      python3

      clang-manpages
      tldr
      iwgtk
      kooha

      pcsx2
      unixtools.netstat

      fastnetmon-advanced

      rzls
      icu

      nuget
      nuget-to-json
      mono
      gnumake
      parted
      gparted


      #reverse engineering ??
      radare2

      #networking tools
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
      atop

      pgcli


      fzf
      feh
      jump
      swappy
      grim
      gnome-tweaks

      bat

      lxqt.lxqt-policykit

      gnome-system-monitor
      gnome-extension-manager

      # sddm theme
      sddm-astronaut

      wayland
      unrar
      brightnessctl
      xfce.thunar

      git
      xfce.tumbler

      inotify-tools
      swww
      font-manager
      btop
      cava
      man-pages

      udisks
      psmisc
      udiskie
      libnotify
      ghostty

      pulseaudio
      vlc
      gammastep

      neovim
      mpd
      mpv
      wl-clipboard
      slurp
      walk
      tmux
      playerctl
      fish
      starship
      gnutar

      wofi

      ranger
      lf
      tree
      spotify
      tree-sitter
      alacritty

      cliphist
      unzip
      gtk3
      jq
      wirelesstools
      libpq

      rofi

      #programming
      typescript
      yarn
      nodejs

      # C++ programming deps
      llvmPackages_20.clang-tools
      lldb_21
      gcc
      cgdb
      gdb-dashboard
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
      cccc
      perf-tools
      systemtap-sdt
      cpplint

      #binary analysis
      binutils

      #docs
      doxygen
      natural-docs

      #build tools
      cmakeCurses
      ninja # Build backend
      pkg-config # Package discovery
      bear
      meson-tools
      include-what-you-use

      # other tools
      jdk
      libtool

      #debuggings
      git-lfs
      ctags
      global

      go
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
  };
}
