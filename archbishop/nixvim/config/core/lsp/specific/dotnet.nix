{
  plugins.easy-dotnet = {
    enable = true;
    settings = {
      test_runner = {
        enable_buffer_test_execution = true;
        viewmode = "float";
      };
      auto_bootstrap_namespace = true;
      terminal.__raw = ''
        function(path, action, args)
          local commands = {
            run = function()
              return string.format("dotnet run --project %s %s", path, args)
            end,
            test = function()
              return string.format("dotnet test %s %s", path, args)
            end,
            restore = function()
              return string.format("dotnet restore %s %s", path, args)
            end,
            build = function()
              return string.format("dotnet build %s %s", path, args)
            end,
          }

          local command = commands[action]() .. "\r"
          require("toggleterm").exec(command, nil, nil, nil, "float")
        end
      '';
      picker = "fzf";
    };
  };
}
