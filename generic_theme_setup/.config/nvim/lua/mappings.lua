local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- dont copy any deleted text , this is disabled by default so uncomment the below mappings if you want them!
--[[ remove this line

map("n", "dd", [=[ "_dd ]=], opt)
map("v", "dd", [=[ "_dd ]=], opt)
map("v", "x", [=[ "_x ]=], opt)

 this line too ]]

-- OPEN TERMINALS --
map("n", "<C-x>", [[<Cmd>vnew term://zsh <CR>]], opt) -- over right
map("n", "<C-l>", [[<Cmd> split term://zsh | resize 10 <CR>]], opt) --  bottom
-- map("n", "<C-t>t", [[<Cmd> tabnew | term <CR>]], opt) -- newtab

-- Tags
map("n", "<leader>[", [[<C-T>]], opt)
map("n", "<leader>]", [[<C-]>]], opt)
map("n", "<leader><Bslash>", [[g] ]], opt)

-- Select all in the file--
map("n", "<C-a>", [[ggVG]], opt)

-- toggle numbers ---
map("n", "<leader>n", [[<Cmd> set nu!<CR>]], opt)

-- Search/Open/FZF
-- map("n", "<C-p>", [[<Cmd>Files<Cr>]], opt)
-- map("n", "<leader>f", [[<Cmd>Ag<Cr>]], opt)
-- map("n", "<C-e>", [[<Cmd>Buffers<Cr>]], opt)
map("n", "<C-f>", [[/<C-R><C-W><Cr>]], opt)

--Copy/Paste
map("n", "<Enter>", [[i<Right><CR>]], opt)
map("v", "<C-c>", [["+yi]], opt)
map("v", "<C-x>", [["+c]], opt)
map("i", "<C-v>", [[<Esc>"+pa]], opt)

--Undo/Redo
map("n", "<C-z>", [[u]], {noremap=true})
map("n", "<C-r>", [[<C-r>]], {noremap=true})
map("i", "<C-z>", [[<C-O>u]], {noremap=true})
map("i", "<C-r>", [[<C-O><C-r>]], {noremap=true})

--Save
map("i", "<C-s>", [[<Esc><Cmd>w<Cr>]], opt)
map("n", "<C-s>", [[<Cmd>w<Cr>]], opt)

--Double J
map("n", "jj", [[<Esc>]], {noremap=true})
map("v", "jj", [[<Esc>]], {noremap=true})
map("i", "jj", [[<Esc>]], {noremap=true})

--Misc
map("n", "<leader><leader>", [[<Cmd>noh<Cr>]], {silent=true})
map("n", "<C-_>", [[<Cmd>CommentToggle<Cr>]]) -- This maps <C-/>. C-/ is translate to C-_ by VIM

--Navigation (skip words)
map ("n", "<C-Left>", [[b]], opt)
map ("n", "<C-Right>", [[w]], opt)

--Select words with shift+Arrow
map ("n", "<S-Left>", [[v]])
map ("n", "<S-Right>", [[v]])
map ("i", "<S-Left>", [[<Esc>v]])
map ("i", "<S-Right>", [[<Esc>v]])
