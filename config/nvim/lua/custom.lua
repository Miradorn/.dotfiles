local cmd = vim.cmd

local function opt(o, v) vim.opt[o] = v end

local function project_files()
    local opts = {} -- define here if you want to define something
    local ok = pcall(require'telescope.builtin'.git_files, opts)
    if not ok then require'telescope.builtin'.find_files(opts) end
end

return {opt = opt, project_files = project_files}
