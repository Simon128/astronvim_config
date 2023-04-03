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
return maps
