{
  plugins.noice = {
    enable = false;
    settings = {
      notify = {
        enabled = false;
      };
      messages = {
        enabled = true;
        view_error = "mini";
        view_warn = "mini";
        view_history = "messages";
        view_search = "virtualtext";
      };
      lsp = {
        message = {
          enabled = true;
        };
        progress = {
          enabled = false;
          view = "mini";
        };
        hover = {
          enabled = true;
          silent = false; # Don't show "No information available"
        };
        signature = {
          enabled = true;
          auto_open = {
            enabled = true;
            trigger = true; # Don't auto-open on typing
          };
        };
      };
      popupmenu = {
        enabled = true;
        backend = "nui";
      };
      # Add routes to filter out unwanted messages
      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              {find = "%d+L, %d+C";} # "25L, 456C written"
              {find = "; after #%d+";} # "; after #1"
              {find = "; before #%d+";} # "; before #1"
              {find = "%d fewer lines";}
              {find = "%d more lines";}
              {find = "%d line less";}
              {find = "%d lines yanked";}
              {find = "written";}
            ];
          };
          view = "mini";
        }
        {
          filter = {
            event = "msg_show";
            kind = "";
            find = "written";
          };
          opts = {
            skip = true;
          };
        }
      ];
      format = {
        filter = {
          pattern = [
            ":%s*%%s*s:%s*"
            ":%s*%%s*s!%s*"
            ":%s*%%s*s/%s*"
            "%s*s:%s*"
            ":%s*s!%s*"
            ":%s*s/%s*"
          ];
          icon = "";
          lang = "regex";
        };
        replace = {
          pattern = [
            ":%s*%%s*s:%w*:%s*"
            ":%s*%%s*s!%w*!%s*"
            ":%s*%%s*s/%w*/%s*"
            "%s*s:%w*:%s*"
            ":%s*s!%w*!%s*"
            ":%s*s/%w*/%s*"
          ];
          icon = "󱞪";
          lang = "regex";
        };
      };
    };
  };
}
