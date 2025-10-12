# Enhanced Aesthetic Lualine Configuration - Fully Riced
{
  plugins.lualine = {
    enable = true;
    lazyLoad.settings.event = "BufEnter";
    settings = {
      options = {
        icons_enabled = true;
        component_separators = "";
        section_separators = {
          left = "";
          right = "";
        };
        # Custom aesthetic theme with transparency and vibrant colors
        theme = {
          normal = {
            a = {
              bg = "none";
              fg = "#89b4fa";
            };
            b = {
              bg = "none";
              fg = "#cdd6f4";
            };
            c = {
              bg = "none";
              fg = "#9399b2";
            };
            x = {
              bg = "none";
              fg = "#9399b2";
            };
            y = {
              bg = "none";
              fg = "#cdd6f4";
            };
            z = {
              bg = "none";
              fg = "#89b4fa";
            };
          };
          insert = {
            a = {
              bg = "none";
              fg = "#a6e3a1";
            };
            b = {
              bg = "none";
              fg = "#cdd6f4";
            };
            c = {
              bg = "none";
              fg = "#9399b2";
            };
          };
          visual = {
            a = {
              bg = "none";
              fg = "#cba6f7";
            };
            b = {
              bg = "none";
              fg = "#cdd6f4";
            };
            c = {
              bg = "none";
              fg = "#9399b2";
            };
          };
          replace = {
            a = {
              bg = "none";
              fg = "#f38ba8";
            };
            b = {
              bg = "none";
              fg = "#cdd6f4";
            };
            c = {
              bg = "none";
              fg = "#9399b2";
            };
          };
          command = {
            a = {
              bg = "none";
              fg = "#94e2d5";
            };
            b = {
              bg = "none";
              fg = "#cdd6f4";
            };
            c = {
              bg = "none";
              fg = "#9399b2";
            };
          };
          inactive = {
            a = {
              bg = "none";
              fg = "#6c7086";
            };
            b = {
              bg = "none";
              fg = "#6c7086";
            };
            c = {
              bg = "none";
              fg = "#6c7086";
            };
          };
        };
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "starter"
            "snacks_dashboard"
            "neo-tree"
          ];
        };
      };

      inactive_sections = {
        lualine_x = [ "filename" ];
      };

      sections = {
        # Left side - Mode with fancy separators
        lualine_a = [
          {
            __unkeyed = "mode";
            fmt.__raw = ''
              function(str)
                local mode_map = {
                  ['n'] = ' NORMAL',
                  ['no'] = ' NORMAL',
                  ['nov'] = ' NORMAL',
                  ['noV'] = ' NORMAL',
                  ['noCTRL-V'] = ' NORMAL',
                  ['niI'] = ' NORMAL',
                  ['niR'] = ' NORMAL',
                  ['niV'] = ' NORMAL',
                  ['i'] = '󰏫 INSERT',
                  ['ic'] = '󰏫 INSERT',
                  ['ix'] = '󰏫 INSERT',
                  ['s'] = ' SELECT',
                  ['S'] = ' SELECT',
                  ['CTRL-S'] = ' SELECT',
                  ['v'] = '󰈈 VISUAL',
                  ['V'] = '󰈈 V-LINE',
                  ['CTRL-V'] = '󰈈 V-BLOCK',
                  ['r'] = ' REPLACE',
                  ['r?'] = ' REPLACE',
                  ['R'] = ' REPLACE',
                  ['c'] = ' COMMAND',
                  ['t'] = ' TERMINAL'
                }
                return mode_map[vim.api.nvim_get_mode().mode] or str
              end
            '';
            color = {
              fg = "#1e1e2e";
              bg = "#89b4fa";
              gui = "bold";
            };
            separator = {
              left = "";
              right = "";
            };
          }
        ];

        # Branch with custom icon and git status
        lualine_b = [
          {
            __unkeyed = "branch";
            icon = {
              __unkeyed = "";
              color = {
                fg = "#f9e2af";
              };
            };
            color = {
              fg = "#f9e2af";
              bg = "none";
              gui = "bold";
            };
            separator = {
              left = "";
              right = "";
            };
          }
          {
            __unkeyed = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
            diff_color = {
              added = {
                fg = "#a6e3a1";
              };
              modified = {
                fg = "#f9e2af";
              };
              removed = {
                fg = "#f38ba8";
              };
            };
            color = {
              bg = "none";
            };
            separator = {
              left = "";
              right = "";
            };
          }
        ];

        # Center - LSP info with custom styling
        lualine_c = [
          {
            __unkeyed.__raw = ''
              function()
                local msg = "󰅤 No LSP"
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                  return msg
                end
                local lsp_names = {}
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    table.insert(lsp_names, client.name)
                  end
                end
                if #lsp_names > 0 then
                  return " " .. table.concat(lsp_names, ", ")
                else
                  return msg
                end
              end
            '';
            color = {
              fg = "#a6e3a1";
              bg = "none";
              gui = "bold";
            };
            separator = {
              left = "";
              right = "";
            };
          }
        ];

        # Empty sections for spacing
        lualine_x = [
          {
            __unkeyed.__raw = ''
              function()
                local clients = vim.lsp.get_clients()
                if next(clients) == nil then
                  return ""
                end
                local progress = vim.lsp.util.get_progress_messages()[1]
                if progress then
                  local msg = progress.message or ""
                  local percentage = progress.percentage or 0
                  local title = progress.title or ""
                  local spinners = {"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"}
                  local ms = vim.loop.hrtime() / 1000000
                  local frame = math.floor(ms / 120) % #spinners
                  if percentage >= 70 then
                    return string.format(" %%#St_LspProgress#%s %s (%s%%%%) ", spinners[frame + 1], title, percentage)
                  end
                  return ""
                end
                return ""
              end
            '';
            color = {
              fg = "#cba6f7";
              bg = "none";
            };
          }
        ];

        lualine_y = [ "" ];

        # Right side - Diagnostics, file info, and position
        lualine_z = [
          {
            __unkeyed = "diagnostics";
            sources = [ "nvim_diagnostic" ];
            sections = [
              "error"
              "warn"
              "info"
              "hint"
            ];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
            diagnostics_color = {
              error = {
                fg = "#f38ba8";
              };
              warn = {
                fg = "#f9e2af";
              };
              info = {
                fg = "#89b4fa";
              };
              hint = {
                fg = "#94e2d5";
              };
            };
            colored = true;
            update_in_insert = false;
            always_visible = false;
            color = {
              bg = "none";
            };
            separator = {
              left = "";
              right = "";
            };
          }
          {
            __unkeyed.__raw = ''
              function()
                local ft = vim.bo.filetype
                local icon_map = {
                  ["lua"] = " Lua",
                  ["nix"] = " Nix",
                  ["rust"] = " Rust",
                  ["go"] = " Go",
                  ["python"] = " Python",
                  ["javascript"] = " JavaScript",
                  ["typescript"] = " TypeScript",
                  ["c"] = " C",
                  ["cpp"] = " C++",
                  ["zig"] = " Zig",
                  ["bash"] = " Bash",
                  ["sh"] = " Shell",
                  ["vim"] = " Vim",
                  ["markdown"] = " Markdown",
                  ["json"] = " JSON",
                  ["yaml"] = " YAML",
                  ["toml"] = " TOML",
                  ["html"] = " HTML",
                  ["css"] = " CSS"
                }
                return icon_map[ft] or " " .. ft:upper()
              end
            '';
            color = {
              fg = "#fab387";
              bg = "none";
              gui = "bold";
            };
            separator = {
              left = "";
              right = "";
            };
          }
          {
            __unkeyed = "location";
            color = {
              fg = "#89dceb";
              bg = "none";
              gui = "bold";
            };
            separator = {
              left = "";
              right = "";
            };
          }
          {
            __unkeyed.__raw = ''
              function()
                local chars = {
                  '󰝤', '󰝥', '󰝦', '󰝧', '󰝨', '󰝩', '󰝪', '󰝫', '󰝬', '󰝭',
                  '󰝮', '󰝯', '󰝰', '󰝱', '󰝲', '󰝳', '󰝴', '󰝵', '󰝶', '󰝷'
                }
                local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
                local position = math.floor(line_ratio * 100)
                local icon_index = math.floor(line_ratio * (#chars - 1)) + 1

                if position <= 5 then
                  return " TOP"
                elseif position >= 95 then
                  return " BOT"
                else
                  return chars[icon_index] .. " " .. position .. "%%"
                end
              end
            '';
            color = {
              fg = "#1e1e2e";
              bg = "#cba6f7";
              gui = "bold";
            };
            padding = 1;
            separator = {
              left = "";
              right = "";
            };
          }
        ];
      };
    };
  };
}
