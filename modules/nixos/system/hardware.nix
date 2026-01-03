{ ... }:
{
  hardware = {
    bluetooth.enable = true;
    bluetooth.network = {
      General = {
        DisableSecurity = true;
      };
    };
    bluetooth.input = {
      General = {
        IdleTimeout = 50;
      };
    };
    graphics.enable = true;
  };






}
