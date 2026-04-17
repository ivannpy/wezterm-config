local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- ─── DETECTAR SISTEMA OPERATIVO ───────────────────────────
local is_mac = wezterm.target_triple:find('darwin') ~= nil
local is_windows = wezterm.target_triple:find('windows') ~= nil
local modifier = is_mac and 'CMD' or 'CTRL'

-- ─── FUENTE Y TAMAÑO DE LA VENTANA ─────────────────────────
config.font = wezterm.font('JetBrains Mono', { weight = 'Regular' })
if is_mac then
    config.font_size = 17.0
    config.initial_cols = 90
    config.initial_rows = 30
	config.native_macos_fullscreen_mode = false
end

-- ─── COLORES ──────────────────────────────────────────────
config.color_scheme = 'Tokyo Night'

-- ─── FONDO / OPACIDAD ─────────────────────────────────────
config.window_background_opacity = 1.0
if is_mac then
	config.macos_window_background_blur = 20
end

-- ─── DECORACIONES DE VENTANA ──────────────────────────────
config.window_decorations = 'TITLE | RESIZE'
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
	{ key = 't', mods = modifier,              action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
	{ key = 'w', mods = modifier,              action = wezterm.action.CloseCurrentTab { confirm = false } },
	{ key = 'd', mods = modifier,              action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	{ key = 'd', mods = modifier .. '|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = 'w', mods = modifier .. '|SHIFT', action = wezterm.action.CloseCurrentPane { confirm = false } },
	{ key = 'f', mods = modifier .. '|CTRL',  action = wezterm.action.ToggleFullScreen },
}

-- ─── SHELL POR DEFECTO ────────────────────────────────────
if is_windows then
	config.default_domain = 'WSL:UbuntuDev'
end

return config
