function copyright_comment()
    if (vim.bo.commentstring ~= "") then
        local commentString = vim.trim(vim.bo.commentstring:gsub("%%s", "")) .. " "
        local copyright = os.getenv("COPYRIGHT_COMMENT")

        if (copyright ~= nil) then
            local targetLine = vim.fn.line(".") - 1
            local copyrightGood

            do
                local i = 0
                local tbl = {}

                for _, line in ipairs (vim.split(copyright, "\n")) do
                    local v = commentString .. line

                    if (v ~= nil) then
                        i = i + 1
                        tbl[i] = v
                    end
                end
                
                copyrightGood = tbl
            end

            return vim.api.nvim_buf_set_lines(0, targetLine, targetLine, false, copyrightGood)
        end
    end

    return nil
end

return copyright_comment
