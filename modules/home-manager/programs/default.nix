{pkgs, ...}: {
  packages = with pkgs; [
    inputs.nixvim.packages.${system}.default
    phinger-cursors
    gruvbox-gtk-theme
    reversal-icon-theme
  ];
}
