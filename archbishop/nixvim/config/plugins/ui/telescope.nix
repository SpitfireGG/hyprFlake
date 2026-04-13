{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [telescope-live-grep-args-nvim];
  plugins.telescope = {
    enable = true;
    extensions = {
      file-browser = {
        enable = true;
      };
      fzf-native = {
        enable = true;
      };
      undo = {
        enable = true;
      };
      live-grep-args = {
        enable = true;
      };
      project = {
        enable = true;
      };
      advanced-git-search.enable = true;
      advanced-git-search.settings = {
        diff_plugin = "diffview";
        git_flags = [
          "-c"
          "delta.side-by-side=false"
        ];
      };
    };

    settings = {
      defaults = {
        layout_config = {
          anchor = "S";
          height = 80;
          # Narrower overall window, wider preview
          width = 0.85;
          preview_cutoff = 1;
          horizontal = {
            prompt_position = "bottom";
            # preview takes up more space, file list less
            preview_width = 0.65;
          };
        };
        sorting_strategy = "ascending";

        # Show path relative to cwd under each result
        path_display = ["truncate"];

        # Smarter search — ignore case unless you type uppercase
        dynamic_preview_title = true;

        # Cycle through results at boundaries
        scroll_strategy = "cycle";

        # Show a few lines of context around the match
        vimgrep_arguments = [
          "rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--trim" # trim leading whitespace in results
        ];
      };
    };

    keymaps = {
      # ── Find ──────────────────────────────────────────────────────────────
      "<leader>/" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>:" = {
        action = "command_history";
        options.desc = "Command History";
      };
      "<leader>b" = {
        action = "buffers";
        options.desc = "+buffer";
      };
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>fh" = {
        # find_files but including hidden dotfiles
        action = "find_files";
        options.desc = "Find hidden files";
      };
      "<leader>ms" = {
        action = "grep_string";
        options.desc = "Grep string under cursor";
      };
      "<leader>fr" = {
        action = "live_grep";
        options.desc = "Find text";
      };
      "<leader>fR" = {
        action = "resume";
        options.desc = "Resume last picker";
      };
      "<leader>fg" = {
        action = "oldfiles";
        options.desc = "Recent files";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Buffers";
      };

      # ── Git ───────────────────────────────────────────────────────────────
      "<C-p>" = {
        action = "git_files";
        options.desc = "Search git files";
      };
      "<leader>gc" = {
        action = "git_commits";
        options.desc = "Git commits (repo)";
      };
      "<leader>gC" = {
        action = "git_bcommits"; # commits for current buffer only
        options.desc = "Git commits (buffer)";
      };
      "<leader>gs" = {
        action = "git_status";
        options.desc = "Git status";
      };
      "<leader>gb" = {
        action = "git_branches";
        options.desc = "Git branches";
      };
      "<leader>gt" = {
        action = "git_stash"; # browse and apply stashes
        options.desc = "Git stash";
      };

      # ── Search / Niche ────────────────────────────────────────────────────
      "<leader>sa" = {
        action = "autocommands";
        options.desc = "Auto commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find";
        options.desc = "Fuzzy find in buffer";
      };
      "<leader>sc" = {
        action = "command_history";
        options.desc = "Command history";
      };
      "<leader>sC" = {
        action = "commands";
        options.desc = "All commands";
      };
      "<leader>sD" = {
        action = "diagnostics";
        options.desc = "Workspace diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags";
        options.desc = "Help pages";
      };
      "<leader>sH" = {
        action = "highlights";
        options.desc = "Highlight groups";
      };
      "<leader>sk" = {
        action = "keymaps";
        options.desc = "Keymaps";
      };
      "<leader>sM" = {
        action = "man_pages";
        options.desc = "Man pages";
      };
      "<leader>sm" = {
        action = "marks";
        options.desc = "Jump to mark";
      };
      "<leader>so" = {
        action = "vim_options";
        options.desc = "Vim options";
      };
      "<leader>sR" = {
        action = "resume";
        options.desc = "Resume";
      };
      "<leader>sq" = {
        action = "quickfix"; # browse quickfix list with preview
        options.desc = "Quickfix list";
      };
      "<leader>sl" = {
        action = "loclist"; # browse location list with preview
        options.desc = "Location list";
      };
      "<leader>sj" = {
        action = "jumplist"; # jump history with file preview
        options.desc = "Jump list";
      };
      "<leader>st" = {
        action = "treesitter"; # browse all TS symbols (funcs, vars…)
        options.desc = "Treesitter symbols";
      };
      "<leader>sr" = {
        action = "registers"; # peek register contents before pasting
        options.desc = "Registers";
      };
      "<leader>ss" = {
        action = "spell_suggest"; # spelling suggestions for word under cursor
        options.desc = "Spell suggest";
      };
      "<leader>sS" = {
        action = "lsp_document_symbols";
        options.desc = "LSP document symbols";
      };
      "<leader>sw" = {
        action = "lsp_workspace_symbols";
        options.desc = "LSP workspace symbols";
      };
      "<leader>si" = {
        action = "lsp_implementations";
        options.desc = "LSP implementations";
      };
      "<leader>sI" = {
        action = "lsp_incoming_calls"; # who calls this function?
        options.desc = "LSP incoming calls";
      };
      "<leader>sO" = {
        action = "lsp_outgoing_calls"; # what does this function call?
        options.desc = "LSP outgoing calls";
      };
      "<leader>uC" = {
        action = "colorscheme";
        options.desc = "Colorscheme preview";
      };
      "<leader>fp" = {
        action = "pickers"; # re-open any previous picker session
        options.desc = "Previous pickers";
      };
    };
  };

  keymaps = [
    # Document-level diagnostics (bufnr=0 scopes to current file)
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options.desc = "Document diagnostics";
    }
    # File browser at cwd
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>Telescope file_browser<cr>";
      options.desc = "File browser";
    }
    # File browser relative to current buffer
    {
      mode = "n";
      key = "<leader>fE";
      action = "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>";
      options.desc = "File browser (buffer dir)";
    }
    # Undo history — pick any past state and diff it
    {
      mode = "n";
      key = "<leader>su";
      action = "<cmd>Telescope undo<cr>";
      options.desc = "Undo history";
    }
    # Find files including hidden/ignored (passes --hidden --no-ignore to rg)
    {
      mode = "n";
      key = "<leader>fH";
      action = "<cmd>Telescope find_files hidden=true no_ignore=true<cr>";
      options.desc = "Find ALL files (hidden+ignored)";
    }
    # Live grep with args — lets you pass rg flags interactively e.g. `-t py`
    {
      mode = "n";
      key = "<leader>fA";
      action = "<cmd>Telescope live_grep_args<cr>";
      options.desc = "Live grep with rg args";
    }
    # Advanced git search extension
    {
      mode = "n";
      key = "<leader>ga";
      action = "<cmd>Telescope advanced_git_search search_log_content<cr>";
      options.desc = "Search git log content";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>Telescope advanced_git_search diff_commit_file<cr>";
      options.desc = "Diff commits touching file";
    }
    # Project switcher
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope project<cr>";
      options.desc = "Switch project";
    }
  ];

  extraConfigLua = ''
    require("telescope").setup{
      pickers = {
        colorscheme = {
          enable_preview = true
        },
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
        git_bcommits = {
          mappings = {
            i = {
              ["<C-d>"] = require("telescope.actions").select_horizontal,
            },
          },
        },
      },
    }
  '';
}
