-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- 默认设置
-- vim.opt.cmdheight = 2 -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications

-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


-- lvim.colorscheme = "peachpuff" -- 亮色主题

-- vim.opt.relativenumber = true -- 相对行号

vim.opt.ignorecase = true -- 搜索不区分大小写

-- 缩进
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.wrap = true

vim.keymap.set('n', '<A-t>', ':setlocal shiftwidth=2 tabstop=2 softtabstop=2 <CR>') -- alt+t 切换tab为2空格

-- alt+h/l/左/右 切换标签页
vim.keymap.set('n', '<A-h>', ':bp<CR>')
vim.keymap.set('n', '<A-l>', ':bn<CR>')
vim.keymap.set('n', '<A-Left>', ':bp<CR>')
vim.keymap.set('n', '<A-Right>', ':bn<CR>')
vim.keymap.set('i', '<A-h>', '<Esc>:bp<CR>')
vim.keymap.set('i', '<A-l>', '<Esc>:bn<CR>')
vim.keymap.set('i', '<A-Left>', '<Esc>:bp<CR>')
vim.keymap.set('i', '<A-Right>', '<Esc>:bn<CR>')

vim.keymap.set('n', '<C-w>', ':bd<CR>') -- ctrl+w 关闭当前标签页
