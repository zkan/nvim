-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")

-- Setup lazy.nvim
local opts = {
  defaults = {
    lazy = true,
  },
  -- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = {
    colorscheme = { "catppuccin-mocha" }
  },
	checker = {
    -- automatically check for plugin updates
    enabled = false
  },
  change_detection = {
    notify = true, -- get a notification when changes are found
  },
}
local plugins = {
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
}

require("lazy").setup(plugins, opts)
