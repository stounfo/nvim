local my_utils = {
    numbercolumn_enabled = function()
        return vim.opt.number:get() or vim.opt.relativenumber:get()
    end,

    statuscolumn = function()
        local function icon(sign, len)
            sign = sign or {}
            len = len or 2
            local text = vim.fn.strcharpart(sign.text or "", 0, len)
            text = text .. string.rep(" ", len - vim.fn.strchars(text))
            return sign.texthl and ("%#" .. sign.texthl .. "#" .. text .. "%*")
                or text
        end

        local function get_mark(buf, lnum)
            local marks = vim.fn.getmarklist(buf)
            vim.list_extend(marks, vim.fn.getmarklist())
            for _, mark in ipairs(marks) do
                if
                    mark.pos[1] == buf
                    and mark.pos[2] == lnum
                    and mark.mark:match("[a-zA-Z]")
                then
                    return {
                        text = mark.mark:sub(2),
                        texthl = "DiagnosticHint",
                    }
                end
            end
        end

        local function get_signs(buf, lnum)
            -- Get regular signs
            local signs = {}

            -- Get extmark signs
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

            -- Sort by priority
            table.sort(signs, function(a, b)
                return (a.priority or 0) < (b.priority or 0)
            end)

            return signs
        end

        local win = vim.g.statusline_winid
        local buf = vim.api.nvim_win_get_buf(win)
        local is_file = vim.bo[buf].buftype == ""
        local show_signs = vim.wo[win].signcolumn ~= "no"

        local components = { "", "", "" } -- left, middle, right

        if show_signs then
            local left, right, fold
            for _, s in ipairs(get_signs(buf, vim.v.lnum)) do
                if
                    s.name
                    and (s.name:find("GitSign") or s.name:find("MiniDiffSign"))
                then
                    right = s
                    vim.print(right)
                    right.text = right.text:sub(1, -2)
                    vim.print(right)
                else
                    left = s
                end
            end
            if vim.v.virtnum ~= 0 then
                left = nil
            end
            vim.api.nvim_win_call(win, function()
                if vim.fn.foldclosed(vim.v.lnum) >= 0 then
                    fold = {
                        text = vim.opt.fillchars:get().foldclose or "",
                        texthl = "Folded",
                    }
                end
            end)
            -- Left: mark or non-git sign
            components[1] = icon(get_mark(buf, vim.v.lnum) or left)
            -- Right: fold icon or git sign (only if file)
            components[3] = is_file and icon(fold or right) or ""
        end

        -- Numbers in Neovim are weird
        -- They show when either number or relativenumber is true
        local is_num = vim.wo[win].number
        local is_relnum = vim.wo[win].relativenumber
        if (is_num or is_relnum) and vim.v.virtnum == 0 then
            if vim.v.relnum == 0 then
                components[2] = is_num and "%l" or "%r" -- the current line
            else
                components[2] = is_relnum and "%r" or "%l" -- other lines
            end
            components[2] = "%=" .. components[2] .. " " -- right align
        end

        if vim.v.virtnum ~= 0 then
            components[2] = "%= "
        end

        return table.concat(components, "")
    end,
}

-- vim.opt.statuscolumn =
--     [[%!v:lua.require'modules.tui.relativenumber'.my_utils.statuscolumn()]]

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
