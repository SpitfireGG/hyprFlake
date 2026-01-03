{pkgs ? import <nixpkgs> {}}:
pkgs.stdenv.mkDerivation rec {
  pname = "chengine";
  version = "7.5";

  src = pkgs.fetchFromGitHub {
    # Fixed: was fetchFromGithub
    owner = "cheat-engine";
    repo = "cheat-engine";
    rev = version;
    hash = "sha256-EG2d4iXhBGmVougCi27O27SrC+L3P4alrgnUvBsT1Ic=";
  };

  nativeBuildInputs = with pkgs; [
    fpc
    lazarus
    cmake
    pkg-config
  ];

  dontWrapQtApps = true;
  dontConfigure = true;

  buildInputs = with pkgs; [
    qt5.qtbase
    qt5.qtdeclarative
    freetype
    zlib
    lua5_3
    capstone
  ];

  configurePhase = ''
    echo "Configuring Cheat Engine build..."
  '';

  buildPhase = ''
    echo "Building Cheat Engine..."
  '';

  installPhase = ''
    echo "Installing Cheat Engine..."
    mkdir -p $out/bin
    mkdir -p $out/share/applications

    cp -r Cheat\ Engine $out/bin/

    chmod +x $out/bin/Cheat\ Engine

  '';

  meta = with pkgs.lib; {
    description = "Cheat Engine - Memory scanner and game modding tool";
    homepage = "https://github.com/cheat-engine/cheat-engine";
    license = licenses.gpl2Plus; # Check actual license
    platforms = platforms.linux;
    maintainers = [];
  };
}
