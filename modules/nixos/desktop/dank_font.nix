{pkgs}: let
  fontsDir = pkgs.linkFarm "dank-mono-fonts" [
    {
      name = "dank_mono_nerd_font";
      path = ./dank_mono_nerd_font;
    }
    {
      name = "Dank_Mono";
      path = ./Dank_Mono;
    }
  ];
in
  pkgs.stdenv.mkDerivation {
    pname = "dank-mono-typeface";
    version = "1.009";

    src = fontsDir;

    installPhase = ''
        mkdir -p $out/share/fonts/truetype

           cp dank_mono_nerd_font/*.otf $out/share/fonts/truetype 2>/dev/null || true
      cp Dank_Mono/*.otf $out/share/fonts/truetype 2>/dev/null || true
    '';
  }
