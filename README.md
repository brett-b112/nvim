# Neovim Config

Personal Neovim configuration using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Structure

```
~/.config/nvim/
├── init.lua                    -- Bootstrap lazy.nvim and load config
├── lua/brett/
│   ├── init.lua                -- Loads remap and set modules
│   ├── remap.lua               -- Key mappings
│   ├── set.lua                 -- Vim options
│   └── plugins/
│       ├── commentary.lua      -- vim-commentary
│       ├── emmet.lua           -- Emmet for HTML/CSS
│       ├── fugitive.lua        -- Git integration
│       ├── harpoon.lua         -- Quick file navigation (harpoon2)
│       ├── lsp.lua             -- LSP via lsp-zero, Mason, nvim-cmp
│       ├── rose-pine.lua       -- Rose Pine colorscheme (moon variant)
│       ├── telescope.lua       -- Fuzzy finder
│       ├── tmux-navigator.lua  -- Tmux pane navigation
│       ├── treesitter.lua      -- Treesitter (highlighting disabled)
│       └── undotree.lua        -- Undo history viewer
└── lazy-lock.json              -- Plugin lock file
```

## Setup

### 1. Clone the repo

```sh
git clone git@github.com:brett-b112/nvim.git ~/.config/nvim
```

### 2. Install dependencies

- **Neovim** >= 0.9
- **Node.js** (required by some LSP servers)
- **g++** / a C compiler (required by Treesitter)
- **ripgrep** (optional, for Telescope grep)

### 3. Launch Neovim

lazy.nvim bootstraps itself automatically on first launch. All plugins will be installed and configured without any manual steps.

```sh
nvim
```

Mason will auto-install the following LSP servers: `ts_ls`, `rust_analyzer`, `pyright`, `pylsp`, `clangd`, `eslint`.

## Key Mappings

Leader key: `<Space>`

### General (`lua/brett/remap.lua`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pv` | Normal | Open file explorer (netrw) |
| `<leader>y` | Normal/Visual | Yank to system clipboard |
| `<leader>Y` | Normal | Yank line to system clipboard |
| `<F9>` | Normal | Save and run current file with Python 3 |

### Telescope (`lua/brett/plugins/telescope.lua`)

Fuzzy finder for files, git files, and grep.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pf` | Normal | Find files in project |
| `<C-p>` | Normal | Find git-tracked files |
| `<leader>ps` | Normal | Grep string (prompts for search term) |

### Harpoon (`lua/brett/plugins/harpoon.lua`)

Quick navigation between pinned files using harpoon2.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | Normal | Add current file to Harpoon list |
| `<C-e>` | Normal | Toggle Harpoon quick menu |
| `<C-t>` | Normal | Jump to Harpoon file 1 |
| `<C-n>` | Normal | Jump to Harpoon file 2 |
| `<C-s>` | Normal | Jump to Harpoon file 3 |
| `<C-S-P>` | Normal | Navigate to previous Harpoon file |
| `<C-S-N>` | Normal | Navigate to next Harpoon file |

### LSP (`lua/brett/plugins/lsp.lua`)

Language server support via lsp-zero v3, Mason, and nvim-cmp.

**Navigation & Info**

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `K` | Normal | Show hover documentation |
| `<leader>vws` | Normal | Search workspace symbols |
| `<leader>vd` | Normal | Open diagnostic float |
| `[d` | Normal | Go to next diagnostic |
| `]d` | Normal | Go to previous diagnostic |

**Refactoring**

| Key | Mode | Action |
|-----|------|--------|
| `<leader>vca` | Normal | Code action |
| `<leader>vrr` | Normal | Show references |
| `<leader>vrn` | Normal | Rename symbol |
| `<C-h>` | Insert | Signature help |

**Completion (nvim-cmp)**

| Key | Mode | Action |
|-----|------|--------|
| `<C-p>` | Insert | Select previous completion item |
| `<C-n>` | Insert | Select next completion item |
| `<C-y>` | Insert | Confirm completion |
| `<C-Space>` | Insert | Trigger completion menu |

**Auto-installed servers (Mason):** `ts_ls`, `rust_analyzer`, `pyright`, `pylsp`, `clangd`, `eslint`

### Fugitive (`lua/brett/plugins/fugitive.lua`)

Git integration via vim-fugitive.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | Normal | Open Git status window |

### Undotree (`lua/brett/plugins/undotree.lua`)

Visual undo history browser.

| Key | Mode | Action |
|-----|------|--------|
| `<leader>u` | Normal | Toggle undo tree panel |

### Tmux Navigator (`lua/brett/plugins/tmux-navigator.lua`)

Seamless navigation between Neovim splits and tmux panes.

| Key | Mode | Action |
|-----|------|--------|
| `<C-h>` | Normal | Navigate left (Neovim split or tmux pane) |
| `<C-j>` | Normal | Navigate down |
| `<C-k>` | Normal | Navigate up |
| `<C-l>` | Normal | Navigate right |

### Commentary (`lua/brett/plugins/commentary.lua`)

Toggle comments via vim-commentary (default mappings).

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | Normal | Toggle comment on current line |
| `gc` | Visual | Toggle comment on selection |
| `gc{motion}` | Normal | Toggle comment over a motion (e.g. `gcap` for paragraph) |

### Emmet (`lua/brett/plugins/emmet.lua`)

HTML/CSS abbreviation expansion via emmet-vim (default mappings).

| Key | Mode | Action |
|-----|------|--------|
| `<C-y>,` | Insert | Expand Emmet abbreviation |
| `<C-y>d` | Insert | Select inner tag |
| `<C-y>D` | Insert | Select outer tag |
| `<C-y>n` | Insert | Jump to next edit point |
| `<C-y>N` | Insert | Jump to previous edit point |
| `<C-y>/` | Insert | Toggle comment on tag |

## Treesitter

Treesitter parsers are auto-installed (`python`, `javascript`, `c`, `lua`, `vim`, `vimdoc`, `query`, `vue`, `html`, `css`) but **syntax highlighting is disabled** (both Treesitter and native Vim syntax). Parsers remain available for other Treesitter features like text objects and incremental selection.

Install additional parsers with `:TSInstall <language>`.
