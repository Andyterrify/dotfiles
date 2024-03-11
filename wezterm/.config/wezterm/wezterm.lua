-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night'

-- font
config.font = wezterm.font_with_fallback({
    {
        family = "Fira Code Nerd Font",
        harfbuzz_features = { "zero", "ss03", "ss05", "cv05", "cv14", "cv31", "ss08", "ss07" }
    },
    -- {
    --     family = "CaskaydiaCove Nerd Font",
    --     harfbuzz_features = { "'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'zero', 'onum'" }
    -- },

    -- <built-in>, BuiltIn
    -- "JetBrains Mono",

    -- /usr/share/fonts/google-noto-color-emoji-fonts/NotoColorEmoji.ttf, FontConfig
    -- Assumed to have Emoji Presentation
    -- Pixel sizes: [128]
    "Noto Color Emoji",

    -- <built-in>, BuiltIn
    "Symbols Nerd Font Mono",

})
config.font_size = 13.0
config.freetype_load_target = "Light"

config.default_prog = { "zsh", "-l", "-c", "tmux attach || tmux" }
-- config.default_prog = { "zsh", "-l" }
config.hide_tab_bar_if_only_one_tab = true
config.term = "xterm-256color"
config.enable_kitty_keyboard = true
config.use_dead_keys = false
config.scrollback_lines = 5000

config.animation_fps = 60

config.audible_bell = "Disabled"
config.visual_bell = {
    fade_in_function = "EaseIn",
    fade_in_duration_ms = 150,
    fade_out_function = "EaseOut",
    fade_out_duration_ms = 150,
}

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0
}

config.disable_default_key_bindings = false

-- config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
-- config.keys = {
--     { mods = "LEADER",     key = 'v',     action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" } },
--     { mods = "LEADER",     key = 'h',     action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" } },
--     { mods = "LEADER",     key = "c",     action = wezterm.action.SpawnTab "CurrentPaneDomain" },
--     { mods = "LEADER",     key = "x",     action = wezterm.action.CloseCurrentPane { confirm = true } },
--     { mods = "LEADER",     key = "z",     action = wezterm.action.TogglePaneZoomState },
--     { mods = "LEADER",     key = "Space", action = wezterm.action.RotatePanes "Clockwise" },
--     { mods = "LEADER",     key = "0",     action = wezterm.action.PaneSelect { mode = "SwapWithActive" } },
--     { mods = "LEADER",     key = "[",     action = wezterm.action.ActivateCopyMode },
--     { mods = "LEADER",     key = "f",     action = wezterm.action.SpawnCommandInNewWindow { args = { "zsh -c ~/.local/scripts/tmux-sessionizer" } } },
--
--     { mods = "ALT",        key = "h",     action = wezterm.action.ActivatePaneDirection 'Left' },
--     { mods = "ALT",        key = "j",     action = wezterm.action.ActivatePaneDirection 'Down' },
--     { mods = "ALT",        key = "k",     action = wezterm.action.ActivatePaneDirection 'Up' },
--     { mods = "ALT",        key = "l",     action = wezterm.action.ActivatePaneDirection 'Right' },
--
--     { mods = "CTRL",       key = "Tab",   action = wezterm.action.ActivateTabRelative(1) },
--
--     { mods = "SHIFT|CTRL", key = "+",     action = wezterm.action.IncreaseFontSize },
--     { mods = "SHIFT|CTRL", key = "_",     action = wezterm.action.DecreaseFontSize },
--     { mods = "SHIFT|CTRL", key = ")",     action = wezterm.action.ResetFontSize },
--     { mods = 'SHIFT|CTRL', key = 'P',     action = wezterm.action.ActivateCommandPalette },
-- }



--  DEFAULT KEY BINDS
--  Can get active keybinds with `wezterm show-keys --lua`
--
-- {
--   keys = {
--     { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
--     { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
--     { key = 'Enter', mods = 'ALT', action = act.ToggleFullScreen },
--     { key = '!', mods = 'CTRL', action = act.ActivateTab(0) },
--     { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
--     { key = '\"', mods = 'ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
--     { key = '\"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
--     { key = '#', mods = 'CTRL', action = act.ActivateTab(2) },
--     { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
--     { key = '$', mods = 'CTRL', action = act.ActivateTab(3) },
--     { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
--     { key = '%', mods = 'CTRL', action = act.ActivateTab(4) },
--     { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
--     { key = '%', mods = 'ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
--     { key = '%', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
--     { key = '&', mods = 'CTRL', action = act.ActivateTab(6) },
--     { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
--     { key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
--     { key = '(', mods = 'CTRL', action = act.ActivateTab(-1) },
--     { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
--     { key = ')', mods = 'CTRL', action = act.ResetFontSize },
--     { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
--     { key = '*', mods = 'CTRL', action = act.ActivateTab(7) },
--     { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
--     { key = '+', mods = 'CTRL', action = act.IncreaseFontSize },
--     { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
--     { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
--     { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
--     { key = '-', mods = 'SUPER', action = act.DecreaseFontSize },
--     { key = '0', mods = 'CTRL', action = act.ResetFontSize },
--     { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
--     { key = '0', mods = 'SUPER', action = act.ResetFontSize },
--     { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
--     { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
--     { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
--     { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
--     { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
--     { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
--     { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
--     { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
--     { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
--     { key = '5', mods = 'SHIFT|ALT|CTRL', action = act.SplitHorizontal{ domain =  'CurrentPaneDomain' } },
--     { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
--     { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
--     { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
--     { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
--     { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
--     { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
--     { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
--     { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },
--     { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },
--     { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
--     { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
--     { key = '=', mods = 'SUPER', action = act.IncreaseFontSize },
--     { key = '@', mods = 'CTRL', action = act.ActivateTab(1) },
--     { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
--     { key = 'C', mods = 'CTRL', action = act.CopyTo 'Clipboard' },
--     { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
--     { key = 'F', mods = 'CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
--     { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
--     { key = 'K', mods = 'CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
--     { key = 'K', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
--     { key = 'L', mods = 'CTRL', action = act.ShowDebugOverlay },
--     { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
--     { key = 'M', mods = 'CTRL', action = act.Hide },
--     { key = 'M', mods = 'SHIFT|CTRL', action = act.Hide },
--     { key = 'N', mods = 'CTRL', action = act.SpawnWindow },
--     { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
--     { key = 'P', mods = 'CTRL', action = act.ActivateCommandPalette },
--     { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
--     { key = 'R', mods = 'CTRL', action = act.ReloadConfiguration },
--     { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
--     { key = 'T', mods = 'CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--     { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--     { key = 'U', mods = 'CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
--     { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
--     { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
--     { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
--     { key = 'W', mods = 'CTRL', action = act.CloseCurrentTab{ confirm = true } },
--     { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
--     { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
--     { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
--     { key = 'Z', mods = 'CTRL', action = act.TogglePaneZoomState },
--     { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
--     { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
--     { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
--     { key = '^', mods = 'CTRL', action = act.ActivateTab(5) },
--     { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
--     { key = '_', mods = 'CTRL', action = act.DecreaseFontSize },
--     { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
--     { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
--     { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
--     { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
--     { key = 'f', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
--     { key = 'k', mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
--     { key = 'k', mods = 'SUPER', action = act.ClearScrollback 'ScrollbackOnly' },
--     { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
--     { key = 'm', mods = 'SHIFT|CTRL', action = act.Hide },
--     { key = 'm', mods = 'SUPER', action = act.Hide },
--     { key = 'n', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
--     { key = 'n', mods = 'SUPER', action = act.SpawnWindow },
--     { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
--     { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
--     { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },
--     { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
--     { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
--     { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
--     { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
--     { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
--     { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
--     { key = 'w', mods = 'SUPER', action = act.CloseCurrentTab{ confirm = true } },
--     { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
--     { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
--     { key = '{', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
--     { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
--     { key = '}', mods = 'SUPER', action = act.ActivateTabRelative(1) },
--     { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
--     { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },
--     { key = 'PageUp', mods = 'SHIFT', action = act.ScrollByPage(-1) },
--     { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
--     { key = 'PageUp', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },
--     { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },
--     { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
--     { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },
--     { key = 'LeftArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
--     { key = 'LeftArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
--     { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
--     { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
--     { key = 'UpArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
--     { key = 'UpArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
--     { key = 'DownArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },
--     { key = 'DownArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },
--     { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' },
--     { key = 'Insert', mods = 'CTRL', action = act.CopyTo 'PrimarySelection' },
--     { key = 'Copy', mods = 'NONE', action = act.CopyTo 'Clipboard' },
--     { key = 'Paste', mods = 'NONE', action = act.PasteFrom 'Clipboard' },
--   },
--
--   key_tables = {
--     copy_mode = {
--       { key = 'Tab', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
--       { key = 'Tab', mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },
--       { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },
--       { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
--       { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
--       { key = '$', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
--       { key = '$', mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
--       { key = ',', mods = 'NONE', action = act.CopyMode 'JumpReverse' },
--       { key = '0', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
--       { key = ';', mods = 'NONE', action = act.CopyMode 'JumpAgain' },
--       { key = 'F', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
--       { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
--       { key = 'G', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackBottom' },
--       { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
--       { key = 'H', mods = 'NONE', action = act.CopyMode 'MoveToViewportTop' },
--       { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
--       { key = 'L', mods = 'NONE', action = act.CopyMode 'MoveToViewportBottom' },
--       { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },
--       { key = 'M', mods = 'NONE', action = act.CopyMode 'MoveToViewportMiddle' },
--       { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
--       { key = 'O', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
--       { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },
--       { key = 'T', mods = 'NONE', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
--       { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
--       { key = 'V', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Line' } },
--       { key = 'V', mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode =  'Line' } },
--       { key = '^', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLineContent' },
--       { key = '^', mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
--       { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },
--       { key = 'b', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
--       { key = 'b', mods = 'CTRL', action = act.CopyMode 'PageUp' },
--       { key = 'c', mods = 'CTRL', action = act.CopyMode 'Close' },
--       { key = 'd', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },
--       { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },
--       { key = 'f', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = false } } },
--       { key = 'f', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
--       { key = 'f', mods = 'CTRL', action = act.CopyMode 'PageDown' },
--       { key = 'g', mods = 'NONE', action = act.CopyMode 'MoveToScrollbackTop' },
--       { key = 'g', mods = 'CTRL', action = act.CopyMode 'Close' },
--       { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
--       { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },
--       { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },
--       { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },
--       { key = 'm', mods = 'ALT', action = act.CopyMode 'MoveToStartOfLineContent' },
--       { key = 'o', mods = 'NONE', action = act.CopyMode 'MoveToSelectionOtherEnd' },
--       { key = 'q', mods = 'NONE', action = act.CopyMode 'Close' },
--       { key = 't', mods = 'NONE', action = act.CopyMode{ JumpForward = { prev_char = true } } },
--       { key = 'u', mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } },
--       { key = 'v', mods = 'NONE', action = act.CopyMode{ SetSelectionMode =  'Cell' } },
--       { key = 'v', mods = 'CTRL', action = act.CopyMode{ SetSelectionMode =  'Block' } },
--       { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },
--       { key = 'y', mods = 'NONE', action = act.Multiple{ { CopyTo =  'ClipboardAndPrimarySelection' }, { CopyMode =  'Close' } } },
--       { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PageUp' },
--       { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },
--       { key = 'End', mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
--       { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
--       { key = 'LeftArrow', mods = 'NONE', action = act.CopyMode 'MoveLeft' },
--       { key = 'LeftArrow', mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
--       { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
--       { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },
--       { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'MoveUp' },
--       { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'MoveDown' },
--     },
--
--     search_mode = {
--       { key = 'Enter', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
--       { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
--       { key = 'n', mods = 'CTRL', action = act.CopyMode 'NextMatch' },
--       { key = 'p', mods = 'CTRL', action = act.CopyMode 'PriorMatch' },
--       { key = 'r', mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },
--       { key = 'u', mods = 'CTRL', action = act.CopyMode 'ClearPattern' },
--       { key = 'PageUp', mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },
--       { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'NextMatchPage' },
--       { key = 'UpArrow', mods = 'NONE', action = act.CopyMode 'PriorMatch' },
--       { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
--     },
--
--   }
-- }

-- and finally, return the configuration to wezterm
return config
