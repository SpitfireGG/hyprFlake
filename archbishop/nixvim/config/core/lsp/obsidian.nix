{
  plugins.obsidian = {
    enable = false;
    settings = {
      preferred_link_style = "markdown";
      completion = {
        min_chars = 2;
        nvim_cmp = false;
      };
      new_notes_location = "current_dir";
      workspaces = [
        {
          name = "work";
          path = "~/obsidian/work";
        }
        {
          name = "startup";
          path = "~/obsidian/startup";
        }
        {
          name = "goMaster";
          path = "~/Dev/Go/httpFromScratch/gomaster";
        }
      ];
    };
  };
}
