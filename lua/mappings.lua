require "nvchad.mappings"

local dap = require("dap");
-- add yours here

local map = vim.keymap.set
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up(n)" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down(n)" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up(v)" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down(v)" })


map('n', '<F5>',dap.continue)
map('n', '<F10>',dap.step_over)
map('n', '<F11>',dap.step_into)
map('n', '<F12>',dap.step_out)
map('n', '<leader>b',dap.toggle_breakpoint)

map('n','<C-a>',"ggVG");
map('n','<C-d>',"Vyp$");

map('v','<leader>fm',"<leader>gw");
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
