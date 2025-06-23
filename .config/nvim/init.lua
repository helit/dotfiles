-- load all lua files
local user_dir = vim.fn.stdpath("config") .. "/lua/user"

for _, file in ipairs(vim.fn.readdir(user_dir)) do
  if file:match("%.lua$") then
    local module = "user." .. file:gsub("%.lua$", "")
    require(module)
  end
end
