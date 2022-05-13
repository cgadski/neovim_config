---@diagnostic disable: different-requires

local utils = require "core.utils"
local map = vim.keymap.set

map("", "<Space>", "<Nop>") -- disable space because leader

-- Normal --
-- Standard Operations
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>u", require("core.utils").toggle_url_match, { desc = "Toggle URL Highlights" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "gx", utils.url_opener_cmd(), { desc = "Open the file under cursor with system app" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "Q", "<Nop>")
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- Terminal
if utils.is_available "nvim-toggleterm.lua" then
  map("n", "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
end

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" })
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" })
map("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" })
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Packer Status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- Lua lsp
map("n", "<leader>lx", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- Alpha
if utils.is_available "alpha-nvim" then
  map("n", "<leader>d", "<cmd>Alpha<cr>", { desc = "Alpha Dashboard" })
end

-- Bufdelete
map("n", "<leader>c", "<cmd>Bdelete!<cr>", { desc = "Close buffer" })

-- Navigate buffers
map("n", "gn", "<cmd>bn<cr>", { desc = "Next buffer" })
map("n", "gp", "<cmd>bp<cr>", { desc = "Previous buffer" })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle_current_linewise()
end, { desc = "Comment line" })
map(
  "v",
  "<leader>/",
  "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
  { desc = "Toggle comment line" }
)

-- GitSigns
if utils.is_available "gitsigns.nvim" then
  map("n", "<leader>gj", function()
    require("gitsigns").next_hunk()
  end, { desc = "Next git hunk" })
  map("n", "<leader>gk", function()
    require("gitsigns").prev_hunk()
  end, { desc = "Previous git hunk" })
  map("n", "<leader>gl", function()
    require("gitsigns").blame_line()
  end, { desc = "View git blame" })
  map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
  end, { desc = "Preview git hunk" })
  map("n", "<leader>gh", function()
    require("gitsigns").reset_hunk()
  end, { desc = "Reset git hunk" })
  map("n", "<leader>gr", function()
    require("gitsigns").reset_buffer()
  end, { desc = "Reset git buffer" })
  map("n", "<leader>gs", function()
    require("gitsigns").stage_hunk()
  end, { desc = "Stage git hunk" })
  map("n", "<leader>gu", function()
    require("gitsigns").undo_stage_hunk()
  end, { desc = "Unstage git hunk" })
  map("n", "<leader>gd", function()
    require("gitsigns").diffthis()
  end, { desc = "View git diff" })
end

-- NeoTree
if utils.is_available "neo-tree.nvim" then
  map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
  map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus Explorer" })
end

-- Session Manager
if utils.is_available "neovim-session-manager" then
  map("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>", { desc = "Load last session" })
  map("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>", { desc = "Save this session" })
  map("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>", { desc = "Delete session" })
  map("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>", { desc = "Search sessions" })
  map(
    "n",
    "<leader>S.",
    "<cmd>SessionManager! load_current_dir_session<cr>",
    { desc = "Load current directory session" }
  )
end

-- Smart Splits
if utils.is_available "smart-splits.nvim" then
  -- Better window navigation
  map("n", "<C-h>", function()
    require("smart-splits").move_cursor_left()
  end, { desc = "Move to left split" })
  map("n", "<C-j>", function()
    require("smart-splits").move_cursor_down()
  end, { desc = "Move to below split" })
  map("n", "<C-k>", function()
    require("smart-splits").move_cursor_up()
  end, { desc = "Move to above split" })
  map("n", "<C-l>", function()
    require("smart-splits").move_cursor_right()
  end, { desc = "Move to right split" })
  map("n", "<C-q>", "<C-w>q", { desc = "Close window" })
else
  map("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
  map("n", "<C-j>", "<C-w>j", { desc = "Move to below split" })
  map("n", "<C-k>", "<C-w>k", { desc = "Move to above split" })
  map("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
  map("n", "<C-Up>", "<cmd>resize -2<CR>", { desc = "Resize split up" })
  map("n", "<C-Down>", "<cmd>resize +2<CR>", { desc = "Resize split down" })
  map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize split left" })
  map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize split right" })
end

-- SymbolsOutline
if utils.is_available "aerial.nvim" then
  map("n", "<leader>lS", "<cmd>AerialToggle<cr>", { desc = "Symbols outline" })
end

-- Telescope
if utils.is_available "telescope.nvim" then
  map("n", "<leader>fw", function()
    require("telescope.builtin").live_grep()
  end, { desc = "Search words" })
  map("n", "<leader>gt", function()
    require("telescope.builtin").git_status()
  end, { desc = "Git status" })
  map("n", "<leader>gb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>gc", function()
    require("telescope.builtin").git_commits()
  end, { desc = "Git commits" })
  map("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
  end, { desc = "Search files" })
  map("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
  end, { desc = "Search buffers" })
  map("n", "<leader>fh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>fm", function()
    require("telescope.builtin").marks()
  end, { desc = "Search marks" })
  map("n", "<leader>fo", function()
    require("telescope.builtin").oldfiles()
  end, { desc = "Search history" })
  map("n", "<leader>sb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>sm", function()
    require("telescope.builtin").man_pages()
  end, { desc = "Search man" })
  map("n", "<leader>sn", function()
    require("telescope").extensions.notify.notify()
  end, { desc = "Search notifications" })
  map("n", "<leader>sr", function()
    require("telescope.builtin").registers()
  end, { desc = "Search registers" })
  map("n", "<leader>sk", function()
    require("telescope.builtin").keymaps()
  end, { desc = "Search keymaps" })
  map("n", "<leader>sc", function()
    require("telescope.builtin").commands()
  end, { desc = "Search commands" })
  map("n", "<leader>ls", function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
      require("telescope").extensions.aerial.aerial()
    else
      require("telescope.builtin").lsp_document_symbols()
    end
  end, { desc = "Search symbols" })
  map("n", "<leader>lR", function()
    require("telescope.builtin").lsp_references()
  end, { desc = "Search references" })
  map("n", "<leader>lD", function()
    require("telescope.builtin").diagnostics()
  end, { desc = "Search diagnostics" })
end

-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Improved Terminal Mappings
map("t", "<c-x>", "<c-\\><c-n>", { desc = "Terminal normal mode" })
map("t", "<c-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
map("t", "<c-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
map("t", "<c-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
map("t", "<c-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })

-- lua REPL
map("n", "<leader>x", ":Luadev<cr>", { desc = "Open Lua output" })
map("v", "<leader>x", "<cr><Plug>(Luadev-Run)", { desc = "Run Lua code" })
map("n", "<leader>fd", ":cd %:p:h<cr>", { desc = "Cd to file"})

