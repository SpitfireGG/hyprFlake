{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: let
  username = "archbishop";
  homeDirectory = "/home/${username}";
in {
  imports = [
    inputs.noctalia.homeModules.default
    ./shell/noctalia/default.nix
  ];

  home = {
    inherit username homeDirectory;
    packages = with pkgs; [
      inputs.noctalia.packages.${system}.default
      reversal-icon-theme
      bc
      hyprlock
      imagemagick
      qbittorrent
      caprine-bin
      vesktop
      wl-clipboard
      unrar
      sway-contrib.grimshot
      glib
      htop
      gcc
      nchat
      wget
      go
      gopls
      playerctl
      mpc-cli
      neovim
      xdg-desktop-portal
      xorg.xev
      procps
      gammastep
      moreutils
      cava
      mpdris2
      pavucontrol
      feh
      xbanish
      delta
    ];
    pointerCursor = {
      gtk.enable = true;

      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 14;
    };
    stateVersion = "24.05";
  };

  programs = {
    nixvim = {
      enable = true;
    };
    home-manager.enable = true;

    # hyprlock
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 0;
          hide_cursor = false;
          no_fade_in = false;
          no_fade_out = false;
        };

        background = [
          {
            monitor = "";
            path = "/home/archbishop/Pictures/anime/okay/Click.jpg";
            blur_passes = 3;
            blur_size = 8;
            noise = 0.0117;
            contrast = 0.8916;
            brightness = 0.7172;
            vibrancy = 0.1696;
            vibrancy_darkness = 0.0;
          }
        ];

        input-field = [
          {
            monitor = "";
            size = "350, 60";
            outline_thickness = 2;
            dots_size = 0.25;
            dots_spacing = 0.35;
            dots_center = true;
            dots_rounding = -1;
            outer_color = "rgba(242, 243, 244, 0.1)";
            inner_color = "rgba(242, 243, 244, 0.05)";
            font_color = "rgba(242, 243, 244, 0.9)";
            fade_on_empty = false;
            fade_timeout = 2000;
            placeholder_text = "<span font_family='Work Sans' foreground='##f2f3f4aa'>󰌾 Enter Password</span>";
            hide_input = false;
            rounding = 25;
            check_color = "rgba(204, 136, 34, 0.2)";
            fail_color = "rgba(204, 34, 34, 0.2)";
            fail_text = "<span font_family='Work Sans' foreground='##cc2222'>Authentication Failed</span>";
            fail_timeout = 2000;
            fail_transition = 300;
            capslock_color = -1;
            numlock_color = -1;
            bothlock_color = -1;
            invert_numlock = false;
            swap_font_color = false;
            position = "0, -150";
            halign = "center";
            valign = "center";
          }
        ];

        label = [
          {
            monitor = "";
            text = "cmd[update:1000] echo \"<span font_family='Work Sans' font_weight='light' font_size='72pt' foreground='##f2f3f4dd'>$(date +'%H:%M')</span>\"";
            color = "rgba(242, 243, 244, 0.9)";
            font_size = 72;
            font_family = "Work Sans";
            shadow_passes = 2;
            shadow_size = 3;
            shadow_color = "rgba(0, 0, 0, 0.3)";
            position = "0, 300";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            text = "cmd[update:1000] echo \"<span font_family='Work Sans' font_weight='normal' font_size='14pt' foreground='##f2f3f499'>$(date +'%A, %B %d, %Y')</span>\"";
            color = "rgba(242, 243, 244, 0.6)";
            font_size = 14;
            font_family = "Work Sans";
            position = "0, 220";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            text = "cmd[update:300000] ~/.config/hypr/scripts/weather.sh";
            color = "rgba(242, 243, 244, 0.7)";
            font_size = 12;
            font_family = "Work Sans";
            position = "30, 30";
            halign = "left";
            valign = "top";
          }

          {
            monitor = "";
            text = "cmd[update:5000] echo \"<span font_family='JetBrainsMono Nerd Font' font_size='10pt' foreground='##f2f3f477'>  $(cat /proc/loadavg | awk '{print $1}') |  $(free -h | awk 'NR==2{print $3\"/\"$2}') | 󰔟 $(uptime -p | sed 's/up //')</span>\"";
            color = "rgba(242, 243, 244, 0.5)";
            font_size = 10;
            font_family = "JetBrainsMono Nerd Font";
            position = "-30, 30";
            halign = "right";
            valign = "top";
          }

          {
            monitor = "";
            text = "cmd[update:1000] echo \"<span font_family='Work Sans' font_weight='light' font_size='16pt' foreground='##f2f3f488'>Welcome back, $(whoami)</span>\"";
            color = "rgba(242, 243, 244, 0.7)";
            font_size = 16;
            font_family = "Work Sans Light";
            position = "0, -250";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            text = "cmd[update:3600000] ~/.config/hypr/scripts/quote.sh";
            color = "rgba(242, 243, 244, 0.6)";
            font_size = 11;
            font_family = "Work Sans Italic";
            position = "0, -350";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            text = "cmd[update:2000] ATTEMPTS=$(cat /tmp/hyprlock_failed_attempts 2>/dev/null || echo 0); [ $ATTEMPTS -gt 0 ] && echo \"<span font_family='Work Sans' foreground='##cc2222'>Failed attempts: $ATTEMPTS</span>\" || echo \"\"";
            color = "rgba(204, 34, 34, 0.8)";
            font_size = 12;
            font_family = "Work Sans";
            position = "0, -400";
            halign = "center";
            valign = "center";
          }
        ];

        image = [
          {
            monitor = "";
            path = "~/.face";
            size = 120;
            rounding = 60;
            border_size = 3;
            border_color = "rgba(242, 243, 244, 0.2)";
            rotate = 0;
            reload_time = -1;
            reload_cmd = "";
            position = "0, 80";
            halign = "center";
            valign = "center";
            shadow_passes = 3;
            shadow_size = 5;
            shadow_color = "rgba(0, 0, 0, 0.3)";
          }

          {
            monitor = "";
            path = "~/.config/hypr/assets/floating-element.png";
            size = 40;
            rounding = 20;
            rotate = 0;
            reload_time = -1;
            position = "200, 200";
            halign = "center";
            valign = "center";
            opacity = 0.3;
          }
          {
            monitor = "";
            path = "~/.config/hypr/assets/floating-element.png";
            size = 25;
            rounding = 15;
            rotate = 45;
            reload_time = -1;
            position = "-180, -180";
            halign = "center";
            valign = "center";
            opacity = 0.2;
          }
        ];

        shape = [
          {
            monitor = "";
            size = "800, 800";
            color = "rgba(255, 255, 255, 0.02)";
            rounding = 400;
            border_size = 1;
            border_color = "rgba(255, 255, 255, 0.05)";
            rotate = 0;
            xray = false;
            position = "0, 0";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            size = "300, 300";
            color = "rgba(100, 200, 255, 0.05)";
            rounding = 150;
            border_size = 0;
            rotate = 0;
            xray = false;
            position = "-300, 200";
            halign = "center";
            valign = "center";
          }

          {
            monitor = "";
            size = "200, 200";
            color = "rgba(255, 150, 100, 0.05)";
            rounding = 100;
            border_size = 0;
            rotate = 0;
            xray = false;
            position = "350, -250";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
    nushell = {
      enable = false;
      configFile.source = /home/archbishop/.config/nushell/config.nu;

      shellAliases = {
        nvim = "/home/archbishop/hyprnix/nixos-config/archbishop/nixvim/result/bin/nvim";
      };
    };
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    git = {
      enable = true;
      userName = "SpitfireGG";
      userEmail = "raambasnet02@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        core.pager = "${pkgs.delta}/bin/delta";
        interactive.diffFilter = "${pkgs.delta}/bin/delta --color-only";
        delta.navigate = true;
        delta.dark = true;
        merge.conflictStyle = "zdiff3";
      };
    };
    bash.enable = true;
    direnv.enable = true;
    fzf.enable = true;
  };
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "gruvbox-dark";
    };
    iconTheme = {
      package = pkgs.reversal-icon-theme;
      name = "Reversal-dark";
    };
  };

  fonts.fontconfig.enable = true;
  systemd.user.startServices = "sd-switch";
}
