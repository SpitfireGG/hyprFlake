{
  globals.mapleader = " ";

  keymaps = [
    # ─────────────────────────────────────────────
    #  ARROW KEY DISCIPLINE
    #  Yell at the user until they use hjkl
    # ─────────────────────────────────────────────
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Up>";
      action = "<cmd>echo '  use k'<CR>";
      options = {
        noremap = true;
        desc = "Use k instead";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Down>";
      action = "<cmd>echo '  use j'<CR>";
      options = {
        noremap = true;
        desc = "Use j instead";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Left>";
      action = "<cmd>echo '  use h'<CR>";
      options = {
        noremap = true;
        desc = "Use h instead";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<Right>";
      action = "<cmd>echo '  use l'<CR>";
      options = {
        noremap = true;
        desc = "Use l instead";
      };
    }
    # Also block arrows in insert mode
    {
      mode = "i";
      key = "<Up>";
      action = "<cmd>echo '  use k'<CR>";
      options = {
        noremap = true;
      };
    }
    {
      mode = "i";
      key = "<Down>";
      action = "<cmd>echo '  use j'<CR>";
      options = {
        noremap = true;
      };
    }
    {
      mode = "i";
      key = "<Left>";
      action = "<cmd>echo '  use h'<CR>";
      options = {
        noremap = true;
      };
    }
    {
      mode = "i";
      key = "<Right>";
      action = "<cmd>echo '  use l'<CR>";
      options = {
        noremap = true;
      };
    }

    # ─────────────────────────────────────────────
    #  BETTER MOTION
    # ─────────────────────────────────────────────

    # Keep cursor centered during scroll / search
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Scroll down, keep cursor centered";
      };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Scroll up, keep cursor centered";
      };
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
      options = {
        desc = "Next match, keep cursor centered";
      };
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
      options = {
        desc = "Prev match, keep cursor centered";
      };
    }
    {
      mode = "n";
      key = "*";
      action = "*zzzv";
      options = {
        desc = "Search word under cursor, stay centered";
      };
    }
    {
      mode = "n";
      key = "#";
      action = "#zzzv";
      options = {
        desc = "Search word backwards, stay centered";
      };
    }
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
      options = {
        desc = "Join lines, keep cursor position";
      };
    }

    # Better line navigation — go to first non-blank / end
    {
      mode = [
        "n"
        "v"
      ];
      key = "H";
      action = "^";
      options = {
        desc = "Jump to first non-blank character";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "L";
      action = "$";
      options = {
        desc = "Jump to end of line";
      };
    }

    # Jump between paragraphs, keep centered
    {
      mode = "n";
      key = "}";
      action = "}zz";
      options = {
        desc = "Next paragraph, centered";
      };
    }
    {
      mode = "n";
      key = "{";
      action = "{zz";
      options = {
        desc = "Prev paragraph, centered";
      };
    }

    # ─────────────────────────────────────────────
    #  FASTER EDITING
    # ─────────────────────────────────────────────

    # Change word under cursor
    {
      mode = "n";
      key = "<C-c>";
      action = "ciw";
      options = {
        desc = "Change inner word";
      };
    }

    # Search and replace word under cursor
    {
      mode = "n";
      key = "<leader>R";
      action = ":%s/\\<<C-r><C-w>\\>//gI<Left><Left><Left>";
      options = {
        desc = "Replace word under cursor (global, case-sensitive)";
      };
    }

    # Clear search highlight
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>nohl<CR>";
      options = {
        desc = "Clear search highlight";
      };
    }

    # Save
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }
    # Save all
    {
      mode = "n";
      key = "<C-S>";
      action = "<cmd>wa<cr><esc>";
      options = {
        silent = true;
        desc = "Save all files";
      };
    }

    # Paste over selection without clobbering register
    {
      mode = "x";
      key = "<leader>p";
      action = ''"_dP'';
      options = {
        desc = "Paste over selection (void register)";
      };
    }

    # Delete to void register
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>D";
      action = ''"_d'';
      options = {
        desc = "Delete to void register";
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "x";
      action = ''"_x'';
      options = {
        desc = "Delete char to void register";
      };
    }

    # Clipboard yank
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = ''"+y'';
      options = {
        desc = "Yank to system clipboard";
      };
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = ''"+Y'';
      options = {
        desc = "Yank line to system clipboard";
      };
    }

    # Indent and stay in visual mode
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        desc = "Indent left, keep selection";
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        desc = "Indent right, keep selection";
      };
    }

    # Move lines up/down in visual mode
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options = {
        desc = "Move selection down";
      };
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options = {
        desc = "Move selection up";
      };
    }

    # Duplicate line
    {
      mode = "n";
      key = "<leader>dd";
      action = "yyp";
      options = {
        desc = "Duplicate line";
      };
    }

    # Select all
    {
      mode = "n";
      key = "<C-a>";
      action = "gg<S-v>G";
      options = {
        desc = "Select all";
      };
    }

    # ─────────────────────────────────────────────
    #  WINDOWS
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>w";
      action = "+windows";
    }
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other window";
      };
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }
    {
      mode = "n";
      key = "<leader>wo";
      action = "<C-W>o";
      options = {
        silent = true;
        desc = "Close all other windows";
      };
    }
    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }
    {
      mode = "n";
      key = "<leader>w=";
      action = "<C-W>=";
      options = {
        silent = true;
        desc = "Equalize window sizes";
      };
    }
    # Resize windows
    {
      mode = "n";
      key = "<leader>w>";
      action = "<C-W>5>";
      options = {
        silent = true;
        desc = "Increase width";
      };
    }
    {
      mode = "n";
      key = "<leader>w<";
      action = "<C-W>5<";
      options = {
        silent = true;
        desc = "Decrease width";
      };
    }
    {
      mode = "n";
      key = "<leader>w+";
      action = "<C-W>5+";
      options = {
        silent = true;
        desc = "Increase height";
      };
    }
    {
      mode = "n";
      key = "<leader>w_";
      action = "<C-W>5-";
      options = {
        silent = true;
        desc = "Decrease height";
      };
    }
    # Navigate windows
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-W>h";
      options = {
        silent = true;
        desc = "Window left";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-W>l";
      options = {
        silent = true;
        desc = "Window right";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-W>k";
      options = {
        silent = true;
        desc = "Window up";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-W>j";
      options = {
        silent = true;
        desc = "Window down";
      };
    }

    # ─────────────────────────────────────────────
    #  TABS
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader><Tab>";
      action = "+tab";
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options = {
        silent = true;
        desc = "New tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options = {
        silent = true;
        desc = "Close tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>n";
      action = "<cmd>tabnext<cr>";
      options = {
        silent = true;
        desc = "Next tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>p";
      action = "<cmd>tabprev<cr>";
      options = {
        silent = true;
        desc = "Previous tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>o";
      action = "<cmd>tabonly<cr>";
      options = {
        silent = true;
        desc = "Close all other tabs";
      };
    }

    # ─────────────────────────────────────────────
    #  BUFFERS
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<C-Tab>";
      action = "<CMD>Telescope buffers initial_mode=normal<CR>";
      options = {
        desc = "Browse open buffers";
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<CMD>bprev<CR>";
      options = {
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      key = "<Tab>";
      action = "<CMD>bnext<CR>";
      options = {
        desc = "Next buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        silent = true;
        desc = "Delete buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bD";
      action = "<cmd>%bdelete|edit#|bdelete#<cr>";
      options = {
        silent = true;
        desc = "Delete all buffers except current";
      };
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>enew<cr>";
      options = {
        silent = true;
        desc = "New empty buffer";
      };
    }

    # ─────────────────────────────────────────────
    #  TELESCOPE — FIND / FILES
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>f";
      action = "+find/file";
    }

    # Files
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options = {
        desc = "Find files";
      };
    }
    {
      mode = "n";
      key = "<leader>fF";
      action = "<cmd>Telescope find_files hidden=true no_ignore=true<cr>";
      options = {
        desc = "Find files (including hidden)";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<cr>";
      options = {
        desc = "Recent files";
      };
    }
    {
      mode = "n";
      key = "<leader>fR";
      action = "<cmd>Telescope oldfiles only_cwd=true<cr>";
      options = {
        desc = "Recent files (cwd)";
      };
    }

    # Grep / text
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        desc = "Live grep";
      };
    }
    {
      mode = "n";
      key = "<leader>fG";
      action = "<cmd>Telescope live_grep glob_pattern=!*.min.* glob_pattern=!node_modules<cr>";
      options = {
        desc = "Live grep (filtered)";
      };
    }
    {
      mode = "n";
      key = "<leader>fw";
      action = "<cmd>Telescope grep_string<cr>";
      options = {
        desc = "Grep word under cursor";
      };
    }
    {
      mode = "v";
      key = "<leader>fw";
      action = "<cmd>Telescope grep_string<cr>";
      options = {
        desc = "Grep visual selection";
      };
    }

    # Buffers & misc
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers sort_mru=true initial_mode=normal<cr>";
      options = {
        desc = "Buffers (MRU)";
      };
    }
    {
      mode = "n";
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
      options = {
        desc = "Help tags";
      };
    }
    {
      mode = "n";
      key = "<leader>fm";
      action = "<cmd>Telescope marks<cr>";
      options = {
        desc = "Marks";
      };
    }
    {
      mode = "n";
      key = "<leader>fM";
      action = "<cmd>Telescope man_pages<cr>";
      options = {
        desc = "Man pages";
      };
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<cr>";
      options = {
        desc = "Keymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope commands<cr>";
      options = {
        desc = "Commands";
      };
    }
    {
      mode = "n";
      key = "<leader>fC";
      action = "<cmd>Telescope command_history<cr>";
      options = {
        desc = "Command history";
      };
    }
    {
      mode = "n";
      key = "<leader>f/";
      action = "<cmd>Telescope search_history<cr>";
      options = {
        desc = "Search history";
      };
    }
    {
      mode = "n";
      key = "<leader>fj";
      action = "<cmd>Telescope jumplist initial_mode=normal<cr>";
      options = {
        desc = "Jump list";
      };
    }
    {
      mode = "n";
      key = "<leader>fq";
      action = "<cmd>Telescope quickfix<cr>";
      options = {
        desc = "Quickfix list";
      };
    }
    {
      mode = "n";
      key = "<leader>fl";
      action = "<cmd>Telescope loclist<cr>";
      options = {
        desc = "Location list";
      };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>Telescope filetypes<cr>";
      options = {
        desc = "Set filetype";
      };
    }
    {
      mode = "n";
      key = "<leader>f.";
      action = "<cmd>Telescope resume<cr>";
      options = {
        desc = "Resume last picker";
      };
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope builtin<cr>";
      options = {
        desc = "All Telescope pickers";
      };
    }

    # Colorscheme picker
    {
      mode = "n";
      key = "<leader>uc";
      action = "<cmd>Telescope colorscheme enable_preview=true<cr>";
      options = {
        desc = "Colorscheme picker (preview)";
      };
    }

    # ─────────────────────────────────────────────
    #  TELESCOPE — GIT
    # ─────────────────────────────────────────────
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>g";
      action = "+git";
    }
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>Telescope git_commits initial_mode=normal<cr>";
      options = {
        desc = "Git commits (project)";
      };
    }
    {
      mode = "n";
      key = "<leader>gC";
      action = "<cmd>Telescope git_bcommits initial_mode=normal<cr>";
      options = {
        desc = "Git commits (buffer)";
      };
    }
    {
      mode = "v";
      key = "<leader>gC";
      action = "<cmd>Telescope git_bcommits_range initial_mode=normal<cr>";
      options = {
        desc = "Git commits for selection";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<cmd>Telescope git_branches initial_mode=normal<cr>";
      options = {
        desc = "Git branches";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Telescope git_status initial_mode=normal<cr>";
      options = {
        desc = "Git status";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<cmd>Telescope git_stash initial_mode=normal<cr>";
      options = {
        desc = "Git stash";
      };
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>Telescope git_files<cr>";
      options = {
        desc = "Git tracked files";
      };
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>lua require('toggleterm').new({cmd='lazygit', direction='float'})<cr>";
      options = {
        silent = true;
        desc = "Lazygit (float)";
      };
    }

    # ─────────────────────────────────────────────
    #  TELESCOPE — LSP
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>ls";
      action = "<cmd>Telescope lsp_document_symbols<cr>";
      options = {
        desc = "Document symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>lS";
      action = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>";
      options = {
        desc = "Workspace symbols";
      };
    }
    {
      mode = "n";
      key = "<leader>lr";
      action = "<cmd>Telescope lsp_references initial_mode=normal<cr>";
      options = {
        desc = "LSP references";
      };
    }
    {
      mode = "n";
      key = "<leader>li";
      action = "<cmd>Telescope lsp_implementations initial_mode=normal<cr>";
      options = {
        desc = "LSP implementations";
      };
    }
    {
      mode = "n";
      key = "<leader>lD";
      action = "<cmd>Telescope lsp_definitions initial_mode=normal<cr>";
      options = {
        desc = "LSP definitions";
      };
    }
    {
      mode = "n";
      key = "<leader>lt";
      action = "<cmd>Telescope lsp_type_definitions initial_mode=normal<cr>";
      options = {
        desc = "LSP type definitions";
      };
    }
    {
      mode = "n";
      key = "<leader>ld";
      action = "<cmd>Telescope diagnostics bufnr=0 initial_mode=normal<cr>";
      options = {
        desc = "Buffer diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>lD";
      action = "<cmd>Telescope diagnostics initial_mode=normal<cr>";
      options = {
        desc = "Workspace diagnostics";
      };
    }

    # ─────────────────────────────────────────────
    #  SEARCH (grug-far)
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>s";
      action = "+search";
    }
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>lua require('grug-far').open()<cr>";
      options = {
        silent = true;
        desc = "Search and Replace (grug-far)";
      };
    }
    {
      mode = "n";
      key = "<leader>sw";
      action = "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>') } })<cr>";
      options = {
        silent = true;
        desc = "Search and Replace word";
      };
    }
    {
      mode = "n";
      key = "<leader>sW";
      action = "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cWORD>') } })<cr>";
      options = {
        silent = true;
        desc = "Search and Replace WORD";
      };
    }
    {
      mode = "v";
      key = "<leader>sr";
      action = "<cmd>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<cr>";
      options = {
        silent = true;
        desc = "Search and Replace selection";
      };
    }
    {
      mode = "n";
      key = "<leader>sf";
      action = "<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<cr>";
      options = {
        silent = true;
        desc = "Search and Replace in file";
      };
    }
    {
      mode = "n";
      key = "<leader>sF";
      action = "<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand('<cword>'), paths = vim.fn.expand('%') } })<cr>";
      options = {
        silent = true;
        desc = "Search and Replace word in file";
      };
    }
    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>lua require('grug-far').toggle_instance()<cr>";
      options = {
        silent = true;
        desc = "Toggle grug-far";
      };
    }

    # ─────────────────────────────────────────────
    #  CODE
    # ─────────────────────────────────────────────
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>c";
      action = "+code";
    }
    {
      mode = "n";
      key = "<C-x>";
      action = "<CMD>Lspsaga outline<CR>";
      options = {
        desc = "Toggle outline";
      };
    }

    # ─────────────────────────────────────────────
    #  UI TOGGLES
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>u";
      action = "+ui";
    }
    {
      mode = "n";
      key = "<leader>ul";
      action = ":lua ToggleLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle line numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uL";
      action = ":lua ToggleRelativeLineNumber()<cr>";
      options = {
        silent = true;
        desc = "Toggle relative line numbers";
      };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = ":lua ToggleWrap()<cr>";
      options = {
        silent = true;
        desc = "Toggle line wrap";
      };
    }
    {
      mode = "n";
      key = "<leader>us";
      action = "<cmd>set spell!<cr>";
      options = {
        silent = true;
        desc = "Toggle spellcheck";
      };
    }
    {
      mode = "n";
      key = "<leader>uc";
      action = "<cmd>Telescope colorscheme enable_preview=true<cr>";
      options = {
        desc = "Colorscheme picker";
      };
    }
    {
      mode = "n";
      key = "<leader>uh";
      action = "<cmd>set hlsearch!<cr>";
      options = {
        silent = true;
        desc = "Toggle search highlight";
      };
    }
    {
      mode = "n";
      key = "<leader>ui";
      action = "<cmd>IndentBlanklineToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle indent guides";
      };
    }

    # ─────────────────────────────────────────────
    #  DEBUG / TEST
    # ─────────────────────────────────────────────
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>d";
      action = "+debug";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>t";
      action = "+test";
    }

    # ─────────────────────────────────────────────
    #  QUIT / SESSION
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>q";
      action = "+quit/session";
    }
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }
    {
      mode = "n";
      key = "<leader>qw";
      action = "<cmd>wqall<cr><esc>";
      options = {
        silent = true;
        desc = "Save and quit all";
      };
    }

    # ─────────────────────────────────────────────
    #  GRAPPLE (file harpoon-style)
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>m";
      action = "<CMD>Grapple toggle<CR>";
      options = {
        desc = "Grapple: toggle tag";
      };
    }
    {
      mode = "n";
      key = "<leader>k";
      action = "<CMD>Grapple toggle_tags<CR>";
      options = {
        desc = "Grapple: open tags";
      };
    }
    {
      mode = "n";
      key = "<leader>K";
      action = "<CMD>Grapple toggle_scopes<CR>";
      options = {
        desc = "Grapple: open scopes";
      };
    }
    {
      mode = "n";
      key = "<leader>j";
      action = "<CMD>Grapple cycle forward<CR>";
      options = {
        desc = "Grapple: cycle forward";
      };
    }
    {
      mode = "n";
      key = "<leader>J";
      action = "<CMD>Grapple cycle backward<CR>";
      options = {
        desc = "Grapple: cycle backward";
      };
    }
    {
      mode = "n";
      key = "<leader>1";
      action = "<CMD>Grapple select index=1<CR>";
      options = {
        desc = "Grapple: select 1";
      };
    }
    {
      mode = "n";
      key = "<leader>2";
      action = "<CMD>Grapple select index=2<CR>";
      options = {
        desc = "Grapple: select 2";
      };
    }
    {
      mode = "n";
      key = "<leader>3";
      action = "<CMD>Grapple select index=3<CR>";
      options = {
        desc = "Grapple: select 3";
      };
    }
    {
      mode = "n";
      key = "<leader>4";
      action = "<CMD>Grapple select index=4<CR>";
      options = {
        desc = "Grapple: select 4";
      };
    }

    # ─────────────────────────────────────────────
    #  MISC
    # ─────────────────────────────────────────────
    {
      mode = "n";
      key = "<leader>zz";
      action = "<CMD>ZenMode | Pencil<CR>";
      options = {
        desc = "Toggle writing mode";
      };
    }
  ];

  extraConfigLua = ''
    -- ── Line number toggles ──────────────────────────────────────────
    function ToggleLineNumber()
      if vim.wo.number then
        vim.wo.number = false
      else
        vim.wo.number = true
        vim.wo.relativenumber = false
      end
    end

    function ToggleRelativeLineNumber()
      if vim.wo.relativenumber then
        vim.wo.relativenumber = false
      else
        vim.wo.relativenumber = true
        vim.wo.number = false
      end
    end

    function ToggleWrap()
      vim.wo.wrap = not vim.wo.wrap
    end

    -- ── Arrow-key shame counter ──────────────────────────────────────
    -- Tracks how many times arrow keys have been pressed this session
    -- and shows running shame score in the message.
    _G._arrow_shame = 0
    local arrow_msgs = {
      "  use hjkl! (%d times)",
      "  seriously, use hjkl (%d times)",
      " hjkl. (%d times)",
      " you know better. hjkl. (%d times)",
      " ...hjkl... (%d times)",
    }
    function _G.ArrowShame()
      _G._arrow_shame = _G._arrow_shame + 1
      local idx = math.min(_G._arrow_shame, #arrow_msgs)
      vim.notify(string.format(arrow_msgs[idx], _G._arrow_shame), vim.log.levels.WARN)
    end

    -- Override the simple echo binds with the counter function
    for _, key in ipairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
      for _, mode in ipairs({ "n", "v", "i" }) do
        vim.keymap.set(mode, key, _G.ArrowShame, { noremap = true, silent = true })
      end
    end

    -- ── Telescope: project-root live grep ───────────────────────────
    -- <leader>fp → grep from the git root even if nvim is opened in a subdir
    vim.keymap.set("n", "<leader>fP", function()
      local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then root = vim.fn.getcwd() end
      require("telescope.builtin").live_grep({ cwd = root, prompt_title = "Grep (project root)" })
    end, { desc = "Live grep from project root" })

    -- ── Telescope: find word under cursor across project ────────────
    vim.keymap.set("n", "<leader>fW", function()
      require("telescope.builtin").grep_string({
        search = vim.fn.expand("<cword>"),
        word_match = "-w",
        prompt_title = "Word: " .. vim.fn.expand("<cword>"),
      })
    end, { desc = "Grep exact word across project" })
  '';
}
