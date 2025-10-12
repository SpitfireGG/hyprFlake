{}: {
  noctalia-shell = {
    position = "top";
    backgroundOpacity = 1;
    monitors = [];
    density = "default";
    showCapsule = true;
    floating = false;
    marginVertical = 0.25;
    marginHorizontal = 0.25;
    widgets = {
      left = [
        {
          id = "SystemMonitor";
        }
        {
          id = "ActiveWindow";
        }
        {
          id = "MediaMini";
        }
      ];
      center = [
        {
          id = "Workspace";
        }
      ];
      right = [
        {
          id = "ScreenRecorder";
        }
        {
          id = "Tray";
        }
        {
          id = "NotificationHistory";
        }
        {
          id = "WiFi";
        }
        {
          id = "Bluetooth";
        }
        {
          id = "Battery";
        }
        {
          id = "Volume";
        }
        {
          id = "Brightness";
        }
        {
          id = "Clock";
        }
        {
          id = "ControlCenter";
        }
      ];
    };
  };
}
