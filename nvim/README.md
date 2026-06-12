# Neovim Keybindings

> Leader key: `<Space>`

---

## Navigation

### Windows / Splits

| Key | Action |
|-----|--------|
| `ss` | Horizontal split |
| `sv` | Vertical split |
| `sh` | Focus left window |
| `sk` | Focus upper window |
| `sj` | Focus lower window |
| `sl` | Focus right window |
| `<C-w><Left>` | Shrink window width |
| `<C-w><Right>` | Expand window width |
| `<C-w><Up>` | Expand window height |
| `<C-w><Down>` | Shrink window height |
| `<leader>ww` | Go to other window |
| `<leader>wd` | Delete window |
| `<leader>wm` | Maximize/toggle window |
| `<leader>-` | Split window below |
| `<leader>\|` | Split window right |

### Tabs

| Key | Action |
|-----|--------|
| `te` | New tab |
| `<Tab>` | Next tab |
| `<S-Tab>` | Previous tab |

### Jumplist

| Key | Action |
|-----|--------|
| `<C-o>` | Jump backward |
| `<C-m>` | Jump forward (remapped from `<C-i>`) |

---

## Editing

| Key | Action |
|-----|--------|
| `+` | Increment number |
| `-` | Decrement number |
| `<C-a>` | Select all |
| `dw` | Delete word backward |

---

## Buffers

| Key | Action |
|-----|--------|
| `<leader>bd` | Delete buffer |
| `<leader>bD` | Delete buffer + window |
| `<leader>bb` | Switch to other buffer |
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bo` | Delete other buffers |
| `<leader>br` | Delete buffers to the right |
| `\\` | List open buffers (Telescope) |

---

## File Explorer

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>E` | Focus file explorer |
| `sf` | File browser at current buffer path (Telescope) |

### Inside Telescope File Browser (normal mode)

| Key | Action |
|-----|--------|
| `N` | Create file/directory |
| `h` | Go to parent directory |
| `/` | Enter insert/search mode |
| `<C-u>` | Scroll list up 10 items |
| `<C-d>` | Scroll list down 10 items |
| `<PageUp>` | Scroll preview up |
| `<PageDown>` | Scroll preview down |

---

## Search (Telescope)

| Key | Action |
|-----|--------|
| `;f` | Find files (including hidden) |
| `;r` | Live grep (including hidden) |
| `;t` | Help tags |
| `;;` | Resume last Telescope picker |
| `;e` | Workspace diagnostics |
| `;s` | Treesitter symbols |
| `<leader>fP` | Find plugin files |
| `<leader>ff` | Find files (root dir) |
| `<leader>fF` | Find files (cwd) |
| `<leader>fg` | Find git files |
| `<leader>fr` | Recent files |
| `<leader>fR` | Recent files (cwd) |
| `<leader>fn` | New file |
| `<leader>sg` | Live grep (root dir) |
| `<leader>sG` | Live grep (cwd) |
| `<leader>sw` | Search word under cursor |
| `<leader>sc` | Command history |
| `<leader>sC` | Commands |
| `<leader>sd` | Document diagnostics |
| `<leader>sD` | Workspace diagnostics |
| `<leader>sh` | Help pages |
| `<leader>sH` | Highlight groups |
| `<leader>sk` | Keymaps |
| `<leader>sm` | Marks |
| `<leader>sM` | Man pages |
| `<leader>sq` | Quickfix list |
| `<leader>sr` | Resume last search |
| `<leader>sR` | Registers |
| `<leader>ss` | Go to symbol (Aerial) |
| `<leader>sS` | Go to symbol (LSP workspace) |
| `<leader>s/` | Search history |
| `<leader>/` | Grep in current buffer |
| `<leader><space>` | Find files (root dir) |
| `<leader>,` | Switch buffer |

---

## LSP

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | References |
| `gI` | Go to implementation |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `gK` | Signature help |
| `<C-k>` | Signature help (insert mode) |
| `<C-j>` | Go to next diagnostic |
| `[d` / `]d` | Previous / next diagnostic |
| `[e` / `]e` | Previous / next error |
| `[w` / `]w` | Previous / next warning |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename symbol (inc-rename) |
| `<leader>cR` | Rename file |
| `<leader>cf` | Format document |
| `<leader>cF` | Format injected langs |
| `<leader>cd` | Line diagnostics popup |
| `<leader>ci` | Incoming calls |
| `<leader>co` | Outgoing calls |
| `<leader>xl` | Open location list |
| `<leader>xq` | Open quickfix list |

---

## Git

### Gitsigns (hunk operations)

| Key | Mode | Action |
|-----|------|--------|
| `]h` | n | Next hunk |
| `[h` | n | Previous hunk |
| `<leader>ghs` | n/v | Stage hunk |
| `<leader>ghr` | n/v | Reset hunk |
| `<leader>ghS` | n | Stage buffer |
| `<leader>ghu` | n | Undo stage hunk |
| `<leader>ghR` | n | Reset buffer |
| `<leader>ghp` | n | Preview hunk inline |
| `<leader>ghb` | n | Blame line (full) |
| `<leader>ghd` | n | Diff this |
| `<leader>ghD` | n | Diff this ~ |
| `ih` | o/x | Select hunk (text object) |

### Diffview

| Key | Action |
|-----|--------|
| `<leader>gd` | Open diff view |
| `<leader>gD` | File history (current file) |
| `<leader>gx` | Close diff view |

### Lazygit

| Key | Action |
|-----|--------|
| `<leader>gg` | Lazygit (root dir) |
| `<leader>gG` | Lazygit (cwd) |
| `<leader>gf` | Lazygit current file history |
| `<leader>gc` | Git commits |
| `<leader>gb` | Git blame line |
| `<leader>go` | Open in browser |

---

## Folding (nvim-ufo)

| Key | Action |
|-----|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open folds except kinds |
| `zm` | Close folds with |
| `za` | Toggle fold under cursor |
| `zo` | Open fold |
| `zc` | Close fold |

---

## Code Outline (Aerial)

| Key | Action |
|-----|--------|
| `<leader>cs` | Toggle Aerial code outline |
| `{` | Previous symbol (inside aerial) |
| `}` | Next symbol (inside aerial) |

---

## Harpoon 2

| Key | Action |
|-----|--------|
| `<leader>H` | Add file to Harpoon |
| `<leader>h` | Harpoon quick menu |
| `<leader>1` | Go to Harpoon file 1 |
| `<leader>2` | Go to Harpoon file 2 |
| `<leader>3` | Go to Harpoon file 3 |
| `<leader>4` | Go to Harpoon file 4 |
| `<leader>5` | Go to Harpoon file 5 |

---

## UI Toggles

| Key | Action |
|-----|--------|
| `<leader>z` | Toggle Zen Mode |
| `<leader>uk` | Toggle Screenkey (keystroke display) |
| `<leader>uf` | Toggle auto-format (global) |
| `<leader>uF` | Toggle auto-format (buffer) |
| `<leader>us` | Toggle spell checking |
| `<leader>uw` | Toggle word wrap |
| `<leader>ul` | Toggle line numbers |
| `<leader>uL` | Toggle relative line numbers |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uc` | Toggle conceal level |
| `<leader>uh` | Toggle inlay hints |
| `<leader>uT` | Toggle Treesitter highlight |
| `<leader>ub` | Toggle light/dark background |
| `<leader>un` | Dismiss all notifications |
| `<leader>ui` | Inspect highlight at cursor |
| `<leader>uI` | Inspect syntax tree |

---

## Plugin Management

| Key | Action |
|-----|--------|
| `<leader>l` | Open Lazy plugin manager |
| `<leader>L` | LazyVim changelog |
| `<leader>cm` | Open Mason (LSP/tool installer) |

---

## Misc

| Key | Action |
|-----|--------|
| `<leader>qq` | Quit all |
| `<leader>K` | Keywordprg (language-specific docs) |
