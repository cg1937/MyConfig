local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- get the current platform
local function get_platform()
	if string.find(wezterm.target_triple, "windows", 1, true) then
		return "windows"
	elseif string.find(wezterm.target_triple, "darwin", 1, true) then
		return "macos"
	elseif string.find(wezterm.target_triple, "linux", 1, true) then
		return "linux"
	else -- other platform return null value
		return ""
	end
end

-- get the pretty tab title
local function get_title_with_icon(tab)
	local title = ""
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		title = tab.active_pane.title
	end

	if string.find(title, "wsl", 1, true) then
		return "  WSL"
	elseif string.find(title, "cmd", 1, true) then
		if string.find(title, "Admin", 1, true) then
			return "  Admin"
		else
			return "  CMD"
		end
	elseif string.find(title, "powershell", 1, true) then
		return "󰨊  PS"
	elseif string.find(title, "PowerShell", 1, true) then
		return "󰨊  Admin"
	elseif string.find(title, "nvim", 1, true) then
		return "  NVIM"
	elseif string.find(title, "ssh", 1, true) then
		return "󱘖  SSH"
	elseif string.find(title, "top", 1, true) then
		return "󱎴  monitor"
	elseif string.find(title, "git", 1, true) then
		return "󰊢  git"
	elseif string.find(title, "vim", 1, true) then
		return "  vim"
	elseif string.find(title, "vi", 1, true) then
		return "  vi"
	else
		return title
	end
end

-- return launch menu context via the platfrom
local function launch_menu_context()
	local platform = get_platform()
	if platform == "windows" then
		return {
			{
				label = "PowerShell",
				args = { "PowerShell.exe", "-NoLogo" },
			},
			{
				label = "CMD",
				args = { "cmd.exe", "-NoLogo" },
			},
		}
	elseif platform == "linux" then
		return {}
	elseif platform == "macos" then
		return {}
	else -- other platform return null value
		return {}
	end
end

local SUB_IDX = {
	"₁",
	"₂",
	"₃",
	"₄",
	"₅",
	"₆",
	"₇",
	"₈",
	"₉",
	"₁₀",
}

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
	local edge_background = "#333333"
	local background = "#333333"
	local foreground = "#333333"
	local attribute = { Intensity = "Normal" }

	if tab.is_active then
		background = "#00ff2c"
		attribute = { Intensity = "Bold" }
	else
		background = "#91a774"
	end

	local edge_foreground = background
	local title_with_icon = get_title_with_icon(tab)
	local left_seq = ""
	local right_seq = ""
	if tab.tab_index == 0 then
		left_seq = ""
	end

	local id = SUB_IDX[tab.tab_index + 1]
	local title = " " .. wezterm.truncate_right(title_with_icon, max_width - 2) .. " "

	return {
		{ Attribute = attribute },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = left_seq },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = id },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = right_seq },
		{ Attribute = { Intensity = "Normal" } },
	}
end)

return {
	check_for_updates = false,
	keys = {
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
		{ key = "F6", mods = "CTRL", action = wezterm.action.ShowLauncher },
	},
	font_size = 13.5,
	font = wezterm.font_with_fallback({
		"IosevkaTerm Nerd Font",
		{ family = "LXGW WenKai", scale = 1 },
	}),
	default_domain = "WSL:Ubuntu-22.04",
	use_fancy_tab_bar = false,
	launch_menu = launch_menu_context(),
	window_background_opacity = 0.95,
	color_scheme = "Everforest Dark Medium (Gogh)",
	freetype_load_target = "Normal",
}
