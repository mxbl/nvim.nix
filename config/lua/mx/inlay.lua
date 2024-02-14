if not pcall(require, "inlay-hints") then
    return false
end

require("inlay-hints").setup {
    renderer = "inlay-hints/render/eol",
    hints = {
        parameter = {
            show = true,
            highlight = "Whitespace",
        },
        type = {
            show = true,
            highlight = "Whitespace",
        },
    },

    eol = {
        right_align = false,
        parameter = {
            separator = ", ",
            format = function(hints)
                return string.format(" <- (%s)", hints)
            end,
        },
        type = {
            separator = ", ",
            format = function(hints)
                return string.format(" => %s", hints)
            end,
        },
    },
}

-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("my-inlay-hints", {}),
--     callback = function(args)
--         local ft = vim.bo[args.buf].filetype
--         if ft ~= "go" then
--             return
--         end
--
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         require("inlay-hints").on_attach(client, args.buf)
--     end,
-- })

return true
