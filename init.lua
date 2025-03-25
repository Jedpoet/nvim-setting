require('options')
require('keymaps')
require('plugins')
require('colorscheme')
require('lsp')
require('line')
require('markdown')
require('start')

vim.opt.termguicolors = true
require("bufferline").setup{
    options = {
        offsets = {
            {
                filetype = "neo-tree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left"
            }
        }
    }
}


