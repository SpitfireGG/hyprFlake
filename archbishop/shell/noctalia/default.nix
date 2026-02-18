{
  pkgs,
  inputs,
  ...
}: {
  programs.noctalia-shell = {
    enable = true;
    settings = {
      settingsVersion = 16;
      bar = {
        position = "top";
        backgroundOpacity = 0.85;
        monitors = [];
        density = "mini";
        showCapsule = false;
        floating = true;
        marginVertical = 0.30;
        marginHorizontal = 0.40;
        widgets = {
          left = [
            {
              id = "MediaMini";
              maxWidth = 300;
              useFixedWidth = false;
              hideAutomatically = false;
              showAlbumArt = true;
              showVisualizer = true;
              visualizerType = "wave";
              scrollingMode = "always";
            }
          ];
          center = [
            {
              id = "controlCenter";
              useDistroLogo = true;
            }
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "Volume";
              displayMode = "alwaysShow";
            }
            {
              id = "Brightness";
              displayMode = "alwaysShow";
            }
            {
              id = "Battery";
              warningThreshold = 30;
              hideIfNotDetected = true;
              showNoctaliaPerformanceToggle = true;
              showPowerProfileControls = true;
              displayMode = "alwaysShow";
            }
            {
              id = "SystemMonitor";
              compactMode = false;
              cpuUssage = true;
              cpuTemperature = true;
              loadAverage = true;
              memoryUsage = true;
              memoryAsPercentage = true;
              networkTraffic = true;
              storageUsage = true;
              diskPath = "/";
            }
            {
              id = "Notification";
            }
            {
              id = "NoctaliaPerformance";
            }
            {
              id = "nightLight";
            }
            {
              id = "Spacer";
              Width = 7;
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      general = {
        avatarImage = "/home/archbishop/Dev/personal/cons.jpg";
        dimDesktop = false;
        showScreenCorners = false;
        forceBlackScreenCorners = false;
        radiusRatio = 1;
        screenRadiusRatio = 1;
        animationSpeed = 1;
        animationDisabled = true;
      };
      location = {
        name = "Kathmandu";
        useFahrenheit = false;
        use12hourFormat = false;
        showWeekNumberInCalendar = true;
      };
      screenRecorder = {
        directory = "";
        frameRate = 60;
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        audioSource = "default_output";
        videoSource = "portal";
      };
      wallpaper = {
        enabled = true;
        directory = "/home/archbishop/Pictures/anime/anime_wallpapers";
        enableMultiMonitorDirectories = false;
        setWallpaperOnAllMonitors = true;
        defaultWallpaper = "/home/archbishop/Pictures/anime/anime_wallpapers/1274337.jpg";
        fillMode = "crop";
        fillColor = "#ff2f22";
        randomEnabled = false;
        randomIntervalSec = 300;
        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
        monitors = [];
      };
      appLauncher = {
        enableClipboardHistory = false;
        position = "center";
        backgroundOpacity = 1;
        pinnedExecs = [];
        useApp2Unit = false;
        sortByMostUsed = true;
        terminalCommand = "alacritty -e";
      };
      controlCenter = {
        position = "close_to_bar_button";
      };
      dock = {
        enabled = false;
        backgroundOpacity = 1;
        floatingRatio = 1;
        onlySameOutput = true;
        monitors = [];
        pinnedApps = [];
      };
      network = {
        wifiEnabled = true;
      };
      notifications = {
        doNotDisturb = false;
        monitors = [];
        location = "top_right";
        alwaysOnTop = false;
        lastSeenTs = 0;
        respectExpireTimeout = false;
        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
      };
      osd = {
        enabled = true;
        location = "top_right";
        monitors = [];
        autoHideMs = 2000;
      };
      audio = {
        volumeStep = 2;
        volumeOverdrive = false;
        cavaFrameRate = 60;
        visualizerType = "linear";
        mprisBlacklist = [];
        preferredPlayer = "";
      };
      ui = {
        fontDefault = "Work Sans";
        fontFixed = "Work Sans";
        fontDefaultScale = 1;
        fontFixedScale = 1;
        monitorsScaling = [];
        idleInhibitorEnabled = false;
        tooltipsEnabled = true;
      };
      brightness = {
        brightnessStep = 2;
      };
      colorSchemes = {
        useWallpaperColors = false;
        predefinedScheme = "Ayu";
        darkMode = true;
        matugenSchemeType = "scheme-fruit-salad";
        generateTemplatesForPredefined = true;
      };
      templates = {
        gtk = false;
        qt = false;
        kitty = false;
        ghostty = false;
        foot = false;
        fuzzel = false;
        vesktop = false;
        pywalfox = false;
        enableUserTemplates = false;
      };
      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
      };
      hooks = {
        enabled = false;
        wallpaperChange = "";
        darkModeChange = "";
      };
    };
  };
}
