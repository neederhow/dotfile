local wezterm = require("wezterm")

return {
	enable_wayland = false,
	-- 更改默认终端
	default_prog = { "zsh" },
	-- 更改字体
	font = wezterm.font("FiraCode Nerd Font"),
	font_size = 21,
	-- 背景半透明
	window_background_opacity = 0.9,
	-- 主题
	color_scheme = "Dracula+",
	-- 关掉 tab 栏
	-- enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	-- 退出时别 confirm
	skip_close_confirmation_for_processes_named = {
		"bash",
		"sh",
		"zsh",
		"fish",
		"tmux",
		"nu",
		"powershell",
	},
	-- 关掉菜单栏
	window_decorations = "RESIZE",
	-- 绑定快捷键
	mouse_bindings = {
		{
			-- 拖拽窗口
			event = { Drag = { streak = 1, button = "Left" } },
			mods = "ALT",
			action = "StartWindowDrag",
		},
		{
			-- paste
			event = { Up = { streak = 1, button = "Right" } },
			mods = "NONE",
			action = wezterm.action.PasteFrom("Clipboard"),
		},
	},
	keys = {
		-- create new tab
		{ key = "n", mods = "ALT", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
		-- paste
		{ key = "v", mods = "ALT", action = wezterm.action.PasteFrom("Clipboard") },
		-- 关闭当前 tab
		{ key = "w", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },

		{ key = "m", mods = "ALT", action = "ToggleFullScreen" },
	},
}
