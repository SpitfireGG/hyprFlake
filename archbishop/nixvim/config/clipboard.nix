{pkgs, ...}: {
  clipboard.register = "unnamedplus";
  clipboard.providers.wl-copy.enable = true;
  clipboard.providers.wl-copy.package = "${pkgs.wl-clipboard}";
}
