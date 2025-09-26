{pkgs, ...}: {
  stylix = {
    enable = false; # Enable stylix!
    autoEnable = false;

    # Base16 color scheme - choose one that fits your aesthetic
    # Popular aesthetic choices:
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    # Alternative beautiful schemes to try:
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    # Or use a custom wallpaper to generate colors automatically
    # image = ./path/to/your/wallpaper.jpg;

    # Aesthetic font choices
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter";
      };
      serif = {
        package = pkgs.libertinus;
        name = "Libertinus Serif";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    # Font sizes for better hierarchy
    fonts.sizes = {
      applications = 11;
      desktop = 10;
      popups = 11;
      terminal = 12;
    };

    # Cursor theme for consistency
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    # Global opacity settings
    # Desktop environment
    gtk.enable = false;
    qt.enable = false;

    # Browsers
    firefox = {
      enable = false;
      profileName = "dev-edition-default";
    };

    # Development tools
    nixvim = {
      enable = false;
      transparentBackground = {
        main = false;
        numberLine = false;
        signColumn = false;
        statusLine = false; # Keep status line opaque for readability
      };
      plugin = "base16-nvim";
    };

    zathura.enable = false;

    btop.enable = false;

    # fish.enable = false;
    nushell.enable = false;
  };

  # Additional aesthetic enhancements
  home.packages = with pkgs; [
    # Icon themes
    papirus-icon-theme
    numix-icon-theme-circle

    # Cursor themes
    bibata-cursors
    capitaine-cursors

    # Additional fonts for better typography
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "Hack"
        "SourceCodePro"
      ];
    })
    font-awesome
    material-design-icons
  ];

  qt = {
    enable = false;
    platformTheme = "gtk";
  };
}
