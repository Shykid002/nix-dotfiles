local wezterm = require("wezterm")

local config = {}

-- your settings here

config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors" }
config.color_scheme = "matugen-theme"

-- add transparency
config.window_background_opacity = 0.85

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.enable_tab_bar = true

config.font = wezterm.font("Fira Code")
-- You can specify some parameters to influence the font selection;
-- for example, this selects a Bold, Italic font variant.
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })

return config
