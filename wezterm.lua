local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ─── FUENTE ───────────────────────────────────────────────
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
config.font_size = 17.0

-- ─── TAMAÑO DE LA VENTANA ─────────────────────────────────
config.initial_cols = 90
config.initial_rows = 30
config.native_macos_fullscreen_mode = false

-- ─── COLORES ──────────────────────────────────────────────
config.color_scheme = 'Tokyo Night'

-- ─── FONDO / OPACIDAD ─────────────────────────────────────
config.window_background_opacity = 1.0
config.macos_window_background_blur = 20

-- ─── DECORACIONES DE VENTANA ──────────────────────────────
config.window_decorations = 'RESIZE' -- sin barra de título nativa
config.window_padding = {
	left = 12,
	right = 12,
	top = 10,
	bottom = 10,
}

-- ─── CURSOR ───────────────────────────────────────────────
config.default_cursor_style = 'BlinkingBar' -- Block | Underline | Bar
config.cursor_blink_rate = 500

-- ─── TABS ─────────────────────────────────────────────────
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- ─── RENDIMIENTO ──────────────────────────────────────────
config.max_fps = 120
config.animation_fps = 60

-- ─── ATAJOS ÚTILES ────────────────────────────────────────
config.keys = {
	{ key = 't', mods = 'CMD',       action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
	{ key = 'w', mods = 'CMD',       action = wezterm.action.CloseCurrentTab { confirm = false } },
	{ key = 'd', mods = 'CMD',       action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{ key = 'd', mods = 'CMD|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = 'w', mods = 'CMD|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = false } },
	{ key = 'f', mods = 'CMD|CTRL', action = wezterm.action.ToggleFullScreen },
}


return config
