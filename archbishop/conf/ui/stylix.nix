{pkgs, ...}: {
  stylix = {
    enable = true;
    autoEnable = false;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/wallpapers/main/landscapes/01.jpg";
      sha256 = "0cd4cd8915155556209212001967200234567890123456789012345678901234";
    };

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

    fonts.sizes = {
      applications = 11;
      desktop = 10;
      popups = 11;
      terminal = 12;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };

  home.packages = with pkgs; [
    papirus-icon-theme
    numix-icon-theme-circle

    bibata-cursors
    capitaine-cursors

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
