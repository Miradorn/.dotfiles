return {
  {
    "mrjones2014/legendary.nvim",
    priority = 10000,
    lazy = false,
    config = function()
      local toolbox = require("legendary.toolbox")

      require("legendary").setup({
        extensions = {
          diffview = true,
          lazy_nvim = true,
          nvim_tree = true,
          smart_splits = true,
        },
        keymaps = {
          {
            "<C-w>f",
            "<C-w>vgf",
            description = "GoTo File in vSplit"
          },
          {
            "<C-w>F",
            "<C-w>vgf",
            description = "GoTo File:Line in vSplit"
          },
          {
            "<BS>",
            "<C-6>",
            description = "goto previous buffer"
          },
          {
            "<leader><leader>",
            "V",
            description = "Linewise Visual Mode",
          },
          {
            "<leader>,",
            ":noh<CR>",
            description = "Clear search highlight",
            opts = { silent = true },
          },

          {
            "<leader>w",
            ":silent w<CR>",
            description = "Write",
            opts = { silent = true },
          },
          {
            "<leader>q",
            ":q<CR>",
            description = "Quit",
            opts = { silent = true },
          },
          {
            "<leader>Q",
            ":q!<CR>",
            description = "Force Quit",
            opts = { silent = true },
          },
          {
            "<leader>x",
            ":bd!<CR>",
            description = "Delete Buffer",
            opts = { silent = true },
          },
          {
            "<leader>e",
            ":e<CR>",
            description = "reload",
            opts = { silent = true },
          },
          {
            "<leader>E",
            ":e!<CR>",
            description = "Force reload",
            opts = { silent = true },
          },

          -- emacs like movement in insert/commandline
          {
            "<C-b>",
            "<left>",
            mode = { "i", "c" },
            description = "Char back",
          },
          {
            "<C-f>",
            "<right>",
            mode = { "i", "c" },
            description = "Char forward",
          },
          {
            "<C-e>",
            "<End>",
            mode = { "i", "c" },
            description = "End of line",
          },
          {
            "<C-a>",
            "<Home>",
            mode = { "i", "c" },
            description = "Beginning of line",
          },
          {
            "<C-p>",
            "<up>",
            mode = { "i", "c" },
            description = "Line up",
          },
          {
            "<C-n>",
            "<down>",
            mode = { "i", "c" },
            description = "Line down",
          },
          {
            "<A-b>",
            "<S-Left>",
            mode = { "i", "c" },
            description = "Word back",
          },
          {
            "<A-f>",
            "<S-Right>",
            mode = { "i", "c" },
            description = "Word forward",
          },

          -- scrrenline wise navigation
          { "j",          "gj" },
          { "k",          "gk" },

          -- edit configs
          { "<leader>et", ":vsplit ~/.config/zellij/config.kdl<cr>", description = "Edit zellij config" },
          { "<leader>ez", ":vsplit ~/.zshrc<cr>",                    description = "Edit zshrc" },
          { "<leader>ek", ":vsplit ~/.config/kitty/kitty.conf<cr>",  description = "edit kitty config" },
          { "<leader>eg", ":vsplit ~/.config/ghostty/config<cr>",    description = "edit ghostty config" },

          -- Lazy
          {
            "<leader>l",
            ":Lazy<Cr>",
            description = "Open Lazy",
            opts = { silent = true },
          },
          {
            "<leader>lu",
            ":Lazy update<Cr>",
            description = "Lazy update",
            opts = { silent = true },
          },

          -- Move Lines
          { "<A-S-j>", "<cmd>m .+1<cr>==", description = "Move down" },
          { "<A-S-k>", "<cmd>m .-2<cr>==", description = "Move up" },
          {
            "<A-J>",
            "<esc><cmd>m .+1<cr>==gi",
            description = "Move down",
            mode = "i",
          },
          {
            "<A-K>",
            "<esc><cmd>m .-2<cr>==gi",
            description = "Move up",
            mode = "i",
          },
          {
            "<A-j>",
            ":m '>+1<cr>gv=gv",
            description = "Move down",
            mode = "v",
          },
          {
            "<A-k>",
            ":m '<-2<cr>gv=gv",
            description = "Move up",
            mode = "v",
          },
        },
        commands = {
          {
            ":Gbrowse",
            function()
              Snacks.gitbrowse()
            end,
            description = "Open current git file in browser"
          },
          {
            ":Gblame",
            ":BlameToggle",
            description = "Show blame information"
          },
          {
            ":Ag {text}<CR>",
            function(input)
              local text = input.fargs and input.fargs[1] or nil

              Snacks.picker.grep({ search = text, live = false })
            end,
            description = "Search string",
            unfinished = true,
            opts = { nargs = "?" },
          },
        },
        autocmds = {
          {
            name = "Yank",
            { "TextYankPost", toolbox.lazy(vim.highlight.on_yank, { timeout = 500 }) },
          },
          {
            name = "LspAttach",
            {
              "LspAttach", require("alst.config.lsp-attach").on_attach,
            },
          },
          {
            name = "FullWidthQF",
            {
              "FileType",
              "if (getwininfo(win_getid())[0].loclist != 1) | wincmd J | endif",
              opts = {
                pattern = { "qf" }
              }
            }
          },
          {
            name = "CodeCompanionRules",
            {
              "User",
              function(event)
                local chat = require("codecompanion").buf_get_chat(event.data.bufnr)
                if not chat then
                  return
                end

                local rule_files = {
                  ".ai-rules.md",
                  "AGENTS.md"
                }

                local slash_commands = require("codecompanion.strategies.chat.slash_commands")
                local start_path = vim.fs.dirname(vim.api.nvim_buf_get_name(0))
                local found_files = {}

                local function try_add_context(dir)
                  for _, rule in ipairs(rule_files) do
                    local path = vim.fs.joinpath(dir, rule)
                    if vim.uv.fs_stat(path) and not vim.list_contains(found_files, path) then
                      table.insert(found_files, path)
                      slash_commands.context(chat, "file", { path = path })
                    end
                  end
                end

                try_add_context(start_path)
                for dir in vim.fs.parents(start_path) do
                  try_add_context(dir)
                end
              end,
              opts = {
                pattern = "CodeCompanionChatCreated",

              }
            }
          }
        },
      })
    end,
  },
}
