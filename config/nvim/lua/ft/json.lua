require('lib/util')

-- jq and prettier disagree about array wrapping, so exactly one may run.
-- A repo carrying a prettier config has opted into prettier's style; everywhere
-- else jq wins, which leaves generated JSON in the shape its generator emitted.
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {"json"},
  callback = function(event)
    local has_prettierrc = GitRepoHasPrettierrc(event.buf)

    local fixers = vim.deepcopy(vim.b[event.buf].ale_fixers or {})
    local idx = indexOf(fixers, has_prettierrc and "jq" or "prettier")
    if idx then
      table.remove(fixers, idx)
    end

    if has_prettierrc then
      vim.diagnostic.enable(false, {bufnr = event.buf})
    end

    vim.b[event.buf].ale_fixers = fixers
    vim.b[event.buf].ale_fix_on_save = 1
  end,
})
