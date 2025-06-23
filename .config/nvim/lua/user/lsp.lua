local function bootstrap_lsps()
  local handle = io.popen("command -v typescript-language-server")
  local output = handle:read("*a")
  handle:close()

  if output == "" then
    print("Installing LSP servers...")
    vim.fn.system({ os.getenv("HOME") .. "/scripts/install-lsps.sh" })
    print("LSP install complete. Restart Neovim.")
  end
end

bootstrap_lsps()

vim.lsp.enable({ "ts_ls", "html", "jsonls", "lua_ls", "eslint" })

vim.api.nvim_create_user_command("LspLogInstalled", function()
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    print("Active LSP: " .. client.name)
  end
end, {})
