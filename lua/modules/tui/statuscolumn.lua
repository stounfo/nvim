local my_utils = {}

my_utils.numbercolumn_enabled = function()
    return vim.opt.number:get() or vim.opt.relativenumber:get()
end

my_utils.icon = function(sign, len)
    sign = sign or {}
    local text = vim.fn.strcharpart(sign.text or "", 0, len)
    text = text .. string.rep(" ", len - vim.fn.strchars(text))
    return sign.texthl and ("%#" .. sign.texthl .. "#" .. text) or text
end

my_utils.get_mark = function(buf, lnum)
    local marks = vim.fn.getmarklist(buf)
    vim.list_extend(marks, vim.fn.getmarklist())
    for _, mark in ipairs(marks) do
        if
            mark.pos[1] == buf
            and mark.pos[2] == lnum
            and mark.mark:match("[a-zA-Z]")
        then
            return {
                name = "Mark",
                text = mark.mark:sub(2),
                texthl = "DiagnosticHint",
                priority = 10,
            }
        end
    end
end

my_utils.get_signs = function(buf, lnum)
    local signs = {}

    local extmarks = vim.api.nvim_buf_get_extmarks(
        buf,
        -1,
        { lnum - 1, 0 },
        { lnum - 1, -1 },
        { details = true, type = "sign" }
    )
    for _, extmark in pairs(extmarks) do
        signs[#signs + 1] = {
            name = extmark[4].sign_hl_group or "",
            text = extmark[4].sign_text,
            texthl = extmark[4].sign_hl_group,
            priority = extmark[4].priority,
        }
    end

    local mark = my_utils.get_mark(buf, lnum)
    if mark then
        table.insert(signs, mark)
    end

    -- Sort by priority
    table.sort(signs, function(a, b)
        return (a.priority or 0) > (b.priority or 0)
    end)

    return signs
end

my_utils.statuscolumn = function()
    local win = vim.g.statusline_winid
    local buf = vim.api.nvim_win_get_buf(win)
    local signcolumn = vim.wo[win].signcolumn
    local show_signs = signcolumn ~= "no"

    local all_signs = my_utils.get_signs(buf, vim.v.lnum)
    local git_sign = {}
    local signs = {}
    for _, s in ipairs(all_signs) do
        if s.name and (s.name:find("GitSign")) then
            git_sign = s
        else
            table.insert(signs, s)
        end
    end

    -- Numbers in Neovim are weird
    -- They show when either number or relativenumber is true
    local is_num = vim.wo[win].number
    local is_relnum = vim.wo[win].relativenumber
    local line_number
    if (is_num or is_relnum) and vim.v.virtnum == 0 then
        if vim.v.relnum == 0 then
            line_number = is_num and "%l" or "%r" -- the current line
        else
            line_number = is_relnum and "%r" or "%l" -- other lines
        end
    end

    local final_line_number = ""
    if line_number then
        if git_sign and git_sign.texthl then
            final_line_number = "%#"
                .. git_sign.texthl
                .. "#"
                .. line_number
                .. " "
        else
            final_line_number = line_number
        end
    end

    local result = ""
    if signcolumn == "number" then
        result = table.concat({
            "%=",
            show_signs and signs[1] and my_utils.icon(signs[1], 1)
                or final_line_number,
        })
    else
        result = table.concat({
            "%=",
            final_line_number,
            show_signs and (my_utils.icon(signs[1], 1) .. " ") or "",
        })
    end
    return result .. " "
end

local _ = {
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        callback = function()
            if my_utils.numbercolumn_enabled() then
                vim.opt.relativenumber = false
                vim.opt.cursorline = false
            end
        end,
    }),
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        callback = function()
            if my_utils.numbercolumn_enabled() then
                vim.opt.relativenumber = true
                vim.opt.cursorline = true
            end
        end,
    }),
}

return {
    "folke/lazy.nvim",
    my_utils = my_utils,
}
