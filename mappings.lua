-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require "astronvim.utils"
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {} }

if is_available "nvim-dap" then
  local launch_debug = function()
    local json_path = vim.fn.getcwd() .. "/launch.json"
    if vim.fn.filereadable(json_path) then require("dap.ext.vscode").load_launchjs(json_path) end
    require("dap").continue()
  end
  maps.n["<F5>"] = { launch_debug, desc = "Debugger: Start" }
  maps.n["<leader>dl"] = { launch_debug, desc = "Start/Continue from launch.json" }
end

maps.n["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" }
maps.n["<leader>bD"] = {
  function()
    require("astronvim.utils.status").heirline.buffer_picker(
      function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
    )
  end,
  desc = "Pick to close",
}
maps.n["<leader>b"] = { name = "Buffers" }

-- harpoon mappings
maps.n["<A-1>"] = {
  function() require("harpoon.mark").set_current_at(1) end,
  desc = "Harpoon: Set mark for current buffer/file on idx 1",
}
maps.n["<A-2>"] = {
  function() require("harpoon.mark").set_current_at(2) end,
  desc = "Harpoon: Set mark for current buffer/file on idx 2",
}
maps.n["<A-3>"] = {
  function() require("harpoon.mark").set_current_at(3) end,
  desc = "Harpoon: Set mark for current buffer/file on idx 3",
}
maps.n["<A-4>"] = {
  function() require("harpoon.mark").set_current_at(4) end,
  desc = "Harpoon: Set mark for current buffer/file on idx 4",
}
maps.n["<A-5>"] = {
  function() require("harpoon.mark").set_current_at(5) end,
  desc = "Harpoon: Set mark for current buffer/file on idx 5",
}
maps.n["<leader>1"] = {
  function() require("harpoon.ui").nav_file(1) end,
  desc = "Harpoon: Jump to mark on idx 1",
}
maps.n["<leader>2"] = {
  function() require("harpoon.ui").nav_file(2) end,
  desc = "Harpoon: Jump to mark on idx 2",
}
maps.n["<leader>3"] = {
  function() require("harpoon.ui").nav_file(3) end,
  desc = "Harpoon: Jump to mark on idx 3",
}
maps.n["<leader>4"] = {
  function() require("harpoon.ui").nav_file(4) end,
  desc = "Harpoon: Jump to mark on idx 4",
}
maps.n["<leader>5"] = {
  function() require("harpoon.ui").nav_file(5) end,
  desc = "Harpoon: Jump to mark on idx 5",
}
maps.n["<A-0>"] = {
  function() require("harpoon.ui").toggle_quick_menu() end,
  desc = "Harpoon: Toggle Quick-Menu",
}
maps.i["#<"] = {
  "\\left<",
}
maps.i["#r"] = {
  "\\right|",
}
maps.i["#l"] = {
  "\\left|",
}
maps.i["#>"] = {
  "\\right>",
}
return maps
