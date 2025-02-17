local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Set the default program to PS
config.default_prog = { 'pwsh.exe', '-NoLogo' }

-- Set the font to "JetBrainsMono Nerd Font"
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Set the background opacity to 0.8 (80% opaque)
config.window_background_opacity = 0.8

return config
