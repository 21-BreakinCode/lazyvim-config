# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on LazyVim, a modern Neovim distribution that provides a pre-configured setup with lazy loading of plugins.

## Architecture

### Configuration Structure

```
~/.config/nvim/
├── init.lua              # Entry point, loads config.lazy
├── lua/
│   ├── config/
│   │   ├── lazy.lua      # Lazy.nvim bootstrap and setup
│   │   ├── options.lua   # Neovim options
│   │   ├── keymaps.lua   # Custom keymaps
│   │   └── autocmds.lua  # Autocommands
│   └── plugins/          # Custom plugin configurations
├── lazy-lock.json        # Plugin version lockfile
├── lazyvim.json          # LazyVim extras configuration
├── cspell.json           # Spell checking dictionary
└── stylua.toml           # Lua code formatter config
```

### Key Components

1. **LazyVim**: Base distribution providing sensible defaults
2. **Lazy.nvim**: Plugin manager with lazy loading capabilities
3. **Custom Plugins**: Located in `lua/plugins/`, each file returns a plugin spec
4. **LazyVim Extras**: Additional language support and features configured in `lazyvim.json`

## Development Commands

### Code Formatting

```bash
# Format Lua files using stylua
stylua lua/

# Stylua configuration:
# - Indent: 4 spaces
# - Column width: 120
```

### Plugin Management

```vim
:Lazy               # Open plugin manager UI
:Lazy sync          # Update all plugins
:Lazy install       # Install missing plugins
:Lazy update        # Update plugins
:Lazy restore       # Restore plugins to versions in lazy-lock.json
```

### Common Keymaps

- `<leader>` is mapped to space by default in LazyVim
- `jj` in insert mode escapes to normal mode
- `<leader>k0` closes all folds
- `<leader>kj` opens all folds

## Adding New Plugins

Create a new file in `lua/plugins/` that returns a plugin specification:

```lua
return {
  "plugin/name",
  config = function()
    -- plugin configuration
  end,
}
```

## Language Support

Currently configured language extras:
- TypeScript/JavaScript (with ESLint)
- Python (with Black formatter)
- Go
- Docker
- Terraform
- YAML
- Markdown
- SQL
- TOML

## Important Files

- `lua/plugins/cspell.lua`: Spell checking configuration
- `lua/plugins/python.lua`: Python-specific enhancements
- `lua/plugins/claudcode.lua`: Claude Code integration
- `lua/plugins/snacks.lua`: Snacks.nvim configuration (animations disabled)
- `lua/plugins/telescope.lua`: Telescope fuzzy finder configuration

## Installation

Fresh installation:
```bash
git clone https://github.com/21-BreakinCode/lazyvim-config ~/.config/nvim
```

Overwrite existing configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup \
    && git clone https://github.com/21-BreakinCode/lazyvim-config ~/.config/nvim
```

## Spell Checking

The configuration includes cspell for spell checking. Custom words are defined in `cspell.json`.