return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },
  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function() require("catppuccin").setup() end,
  },
  {
    "Saimo/peek.nvim",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup {}
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
}
