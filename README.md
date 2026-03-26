# My Neovim Configuration

## Keymap
_Core Keymap:_ 
| Keymap | Command | Description |
|-|-|-|
|\<leader>q| <cmd>quitall<cr> | Quit all buffers |
|\<leader>Q| <cmd>quitall!<cr> | Force quit all buffers |
|\<leader>w| <cmd>write<cr> | Save changes |
|\<leader>v| <C-v> | Visual block |

_LSP Keymap:_
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

_Plugins Keymap:_ 
| Plugin | Keymap | Command | Description |
| - | - | - | - |
| gitsigns | \<leader>hp / gs.preview_hunk | Hunk preview | 
| gitsigns | \<leader>hd / gs.diffthis | Hunk diffthis | 
| gitsigns | \<leader>hs / gs.toggle_deleted | Hunk show deleted on screen | 
| gitsigns | \<leader>bw / gs.blame_line | Display blame in window | 
| gitsigns | \<leader>bf / gs.blame | Display blame in file | 
| gitsigns | \<leader>bl / gs.toggle_curent_line_blame | Display blame in line | 
| nvim_cmp | **todo:** <C-Space> / cmp.mapping.complete |  | 
| nvim_cmp | \<CR> / cmp.mapping.confirm({select=true}) | Confirm current select | 
| nvim_cmp | \<Tab> / cmp.select_next_item | Select next item | 
| nvim_cmp | \<S-Tab> / cmp.select_prev_item | Select prev item | 
| nvim_tree | \<leader>e / tree.open/tree.close/tree.focus | Select prev item | 
| telescope | \<leader>ff / telescope.builtin.find_files | Find files | 
| telescope | \<leader>fg / telescope.builtin.live_grep | Find in ripgrep | 
| telescope | \<leader>fs / telescope.builtin.grep_string | Find by string | 
| telescope | \<leader>fb / telescope.builtin.buffers | Find in buffers | 
| telescope | \<leader>fh / telescope.builtin.help_tags | Telescope help | 

