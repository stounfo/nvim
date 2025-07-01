-- :luafile test_snippets/test_colors.lua
vim.opt.termguicolors = false
for i = 0, 255 do
    local text = "|" .. i .. " "
    vim.cmd("hi Color" .. i .. " ctermbg=" .. i)
    vim.cmd("echohl Color" .. i .. ' | echon "' .. text .. '" | echohl None')
end
