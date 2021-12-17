local cmd = vim.cmd
local map_key = vim.api.nvim_set_keymap

local function opt(o, v)
         vim.opt[o] = v
end

local function autocmd(group, cmds, clear)
        clear = clear == nil and false or clear
        if type(cmds) == "string" then cmds = { cmds } end
        cmd("augroup " .. group)
        if clear then cmd [[au!]] end
        for _, c in ipairs(cmds) do cmd("autocmd " .. c) end
        cmd [[augroup END]]
end

local function map(modes, lhs, rhs, opts)
        opts = opts or {}
        opts.noremap = opts.noremap == nil and true or opts.noremap
        if type(modes) == "string" then modes = { modes } end
        for _, mode in ipairs(modes) do map_key(mode, lhs, rhs, opts) end
end


local function project_files()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require'telescope.builtin'.git_files, opts)
  if not ok then require'telescope.builtin'.find_files(opts) end
end

return { opt = opt, autocmd = autocmd, map = map, project_files = project_files }
