{
  plugins.grug-far = {
    enable = true;
    settings = {
      debounceMs = 1000;
      engine = "ripgrep";
      engines = {
        ripgrep = {
          path = "rg";
          showReplaceDiff = true;
        };
      };
      maxSearchMatches = 2000;
      maxWorkers = 8;
      minSearchChars = 1;
      normalModeSearch = false;
    };
  };
}
