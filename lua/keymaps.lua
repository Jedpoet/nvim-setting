-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<Space>', ':', opts)
vim.keymap.set('n', '<C-e>', ':Neotree<CR>', opts)
vim.keymap.set('n', '<leader>fa', ":lua require('fzf-lua').files({cwd='/'})<CR>",opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Nvim-move setting
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-----------------
-- Insert mode --
-----------------

vim.keymap.set('i', 'jk', '<Esc>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Nvim-move setting
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-------------------
-- Markdown only --
-------------------

local mar = {
    buffer = true,
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.api.nvim_create_autocmd("FileType",{
    pattern = "markdown",
    callback = function()
        --vim.opt_local.formatoptions:append({ "r", "o", "n" }) -- 讓 `1.`、`-`、`>` 續行
        vim.keymap.set('n', "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", mar)
        vim.keymap.set('i', "$", "$ $<++><Esc>F$hi", mar)
        vim.keymap.set('i', "<,", "< ><++><Esc>F<hhi", mar)
        vim.keymap.set('i', ",t", "| <tt> | <++> |<CR>| ---- | ---- |<CR>| <++> | <++> |<Esc>/<tt><CR>:noh<CR>c4l", mar)
        vim.keymap.set('i', ",f", "<Esc>/<++><CR>:noh<CR>c4l", mar)
    end
})
