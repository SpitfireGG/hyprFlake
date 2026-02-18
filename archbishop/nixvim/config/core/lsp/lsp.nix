{
  lib,
  system,
  pkgs ? import <nixpkgs> {},
  ...
}: {
  plugins = {
    cmp = {
      enable = false;
      settings = {
        autoEnableSources = true;
        experimental = {
          ghost_text = true;
        };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
          format = ''
            function(entry, vim_item)
              local kind_icons = {
                Text = "󰊄",
                Method = "",
                Function = "󰡱",
                Constructor = "",
                Field = "",
                Variable = "󱀍",
                Class = "",
                Interface = "",
                Module = "󰕳",
                Property = "",
                Unit = "",
                Value = "",
                Enum = "",
                Keyword = "",
                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                EnumMember = "",
                Constant = "",
                Struct = "",
                Event = "",
                Operator = "",
                TypeParameter = "",
              }
              vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
              return vim_item
            end
          '';
        };
        window = {
          completion = {
            border = "rounded";
          };
          documentation = {
            border = "rounded";
          };
        };

        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end, {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() else fallback() end end, {'i', 's'})";
        };
        sources = [
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {name = "buffer";}
          {name = "path";}
          {name = "emoji";}
        ];
      };
    };

    luasnip.enable = true;

    lsp-format = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        jdtls = {
          enable = true;
          cmd = [
            "${pkgs.jdt-language-server}/bin/jdtls"
            "-data"
            ".cache/jdtls/workspace"
            "configuration"
            "/home/archbishop/.cache/jdtls/config"
          ];
          autostart = false;
          rootMarkers = [
            ".git" # Git repository
            "pom.xml" # Maven
            "build.gradle" # Gradle
            "build.gradle.kts" # Gradle Kotlin DSL
            "settings.gradle" # Gradle multi-project
            "gradlew" # Gradle wrapper
            "mvnw" # Maven wrapper
            ".project" # Eclipse project
            ".classpath" # Eclipse classpath
            "build.xml" # Ant
            ".idea" # IntelliJ IDEA
            "project.clj" # Leiningen (Clojure)
          ];
        };
        # java_language_server.enable = true;

        eslint.enable = false;
        qmlls = {
          enable = false;
          cmd = ["${pkgs.qt6.qtdeclarative}/bin/qmlls"];
          filetypes = [
            "qml"
            "qmljs"
          ];
          rootMarkers = [
            ".qmlls.ini"
            ".git"
            "CMakeLists.txt"
            "*.pro"
          ];
        };
        cssls = {
          enable = true;
          filetypes = [
            "css"
            "scss"
            "html"
            "htmx"
            "js"
          ];
        };
        lua_ls.enable = false;

        pyright.enable = true;
        gopls.enable = true;
        ts_ls = {
          enable = true;
          filetypes = [
            "cshtml"
            "razor"
            "cs"
            "tsx"
          ];
        };
        tailwindcss = {
          enable = true;

          autostart = false;
          filetypes = [
            "jsx"
            "tsx"
          ];
          rootMarkers = [
            "package.json"
            "package.lock"
          ];
        };
        html.enable = true;
        clangd = {
          enable = true;
          rootMarkers = [
            "compile_commands.json"
            ".clangd"
            ".clang-format"
            ".clang-tidy"
            "compile_flags.txt"
            "configure.ac"
            ".git"
          ];
          cmd = [
            "${pkgs.llvmPackages_20.clang-tools}/bin/clangd"
            "--background-index"
            "--header-insertion-decorators"
            "--experimental-modules-support"
            "--all-scopes-completion"
            "--clang-tidy"
            "--log=error"
            "--query-driver=/**/*"
          ];
        };

        omnisharp = {
          enable = false;
          settings = {
            enableMsBuildLoadProjectsOnDemand = true;
            enableImportCompletion = true;
            organizeImportsOnFormat = true;
            useModernNet = false;
          };
        };

        postgres_lsp.enable = true;
        asm_lsp = {
          enable = false;
          filetypes = [
            "s"
            "asm"
            "S"
          ];
          cmd = ["asm-lsp"];
        };

        bashls = {
          enable = true;
          autostart = true;
          settings = {
            shellcheck = {
              enable = true;
              executablePath = "${lib.getExe pkgs.shellcheck}";
            };
            shfmt = {
              enable = true;
              executablePath = "${lib.getExe pkgs.shfmt}";
            };
            hover = {
              displayFormat = "plaintext";
              showKeywords = true;
              showBuiltins = true;
              showExternalCommands = true;
            };
          };
        };

        yamlls.enable = false;

        nixd = {
          enable = true;
          settings = {
            options.nixvim.expr = "self.packages.${pkgs.system}.default.options";
            formatting = {
              command = ["${lib.getExe pkgs.alejandra}"];
            };
            evaluation = {
              enable = false;
            };
            completion = {
              enable = true;
              enableAuto = true;
              importStrategy = "recursive";
            };
            hover = {
              enable = true;
            };
            documentLink = {
              enable = true;
            };
            definition = {
              enable = true;
            };
            references = {
              enable = true;
            };
            documentSymbol = {
              enable = true;
            };
            codeAction = {
              enable = true;
            };
            inlayHint = {
              enable = true;
            };
          };
        };

        nil_ls.enable = false;
      };

      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Action";
          };
        };

        diagnostic = {
          "<leader>zz" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };

  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers["textDocument/hover"], {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers["textDocument/signatureHelp"], {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    -- require('lspconfig.ui.windows').default_options = {
    --   border = _border
    -- }

    local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  '';
}
