require "nvchad.options"

-- add yours here!

vim.opt.wrap = false;

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
