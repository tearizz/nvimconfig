# Neovim Configuration
## Environment
- Version:  **Neovim 0.12 dev**
- Plugins manage: **Vim.pack**

## Keymap
### Core Keymap 
| Keymap | Command | Description |
|-|-|-|
|\<leader>q| <cmd>quitall<cr> | Quit all buffers |
|\<leader>Q| <cmd>quitall!<cr> | Force quit all buffers |
|\<leader>w| <cmd>write<cr> | Save changes |
|\<leader>v| <C-v> | Visual block |

### LSP Keymap
| Keymap | Command | Description |
|-|-|-|
|K|vim.lsp.buf.hover|Hover|
|gd|vim.lsp.buf.definition|Goto definition|
|gr|vim.lsp.buf.references|Goto references|
|gI|vim.lsp.buf.implementation|Goto implementation|
|gn|vim.lsp.buf.type_definition|Goto type definition|
|\<leader>rn|vim.lsp.buf.rename()|Rename|
|\<leader>ca|vim.lsp.buf.code_action|Code action|
|[d|vim.diagnostic.goto_prev|Goto prev diagnostic|
|d]|vim.diagnostic.goto_next|Goto next diagnostic|
|\<leader>ds|vim.diagnostic.open_float|Show diagnostic|

### Plugins Keymap
#### Gitsigns 
| Keymap | Command | Description |
| - | - | - |
| \<leader>hp | gs.preview_hunk | Hunk preview | 
|\<leader>hd | gs.diffthis | Hunk diffthis | 
|\<leader>hs | gs.toggle_deleted | Hunk show deleted on screen | 
| \<leader>bw | gs.blame_line | Display blame in window | 
| \<leader>bf | gs.blame | Display blame in file | 
| \<leader>bl | gs.toggle_curent_line_blame | Display blame in line | 

#### Nvim-cmp
| Keymap | Command | Description |
| - | - | - |
| 🥔 **todo:** \<C-Space> | cmp.mapping.complete |  | 
| \<CR> | cmp.mapping.confirm({select=true}) | Confirm current select | 
| \<Tab> | cmp.select_next_item | Select next item | 
| \<S-Tab> | cmp.select_prev_item | Select prev item | 
| \<leader>e | tree.open/tree.close/tree.focus | Select prev item | 

#### telescope
| Keymap | Command | Description |
| - | - | - |
| \<leader>ff | telescope.builtin.find_files | Find files | 
| \<leader>fg | telescope.builtin.live_grep | Find in ripgrep | 
| \<leader>fs | telescope.builtin.grep_string | Find by string | 
| \<leader>fb | telescope.builtin.buffers | Find in buffers | 
| \<leader>fh | telescope.builtin.help_tags | Telescope help | 

