local M = {
  Chat_bufnr = nil,
  Chat_winid = nil,
  Current_winid = nil
}

M.GetOrCreateChatWindow = function()
  Chat_bufnr = vim.fn.bufnr('Claude Chat')
  if Chat_bufnr == -1 or not vim.fn.bufnr(Chat_bufnr) then
    -- OpenClaudeChat()
    Chat_bufnr = vim.fn.bufnr('Claude Chat')
  end
  Chat_winid = vim.fn.bufwinid(Chat_bufnr)
  Current_winid = vim.fn.win_getid()
  -- return { chat_bufnr, chat_winid, current_winid }
end

M.OpenClaudeChat = function()
  local claude_bufnr = vim.fn.bufnr('Claude Chat')
  if claude_bufnr == -1 or not vim.fn.bufloaded(claude_bufnr) then
    vim.cmd('botright new Claude Chat')
    vim.opt_local.buftype = nofile
    vim.opt_local.bufhidden = 'hide'
    vim.opt_local.swapfile = false
    vim.opt_local.linebreak = true

    -- TODO
    -- vim.opt_local.foldmethod = 'expr'
    -- vim.opt_local.foldexpr = GetChatFold()
    -- vim.opt_local.foldlevel = 1
    --
    -- TODO: chat syntax

    vim.api.nvim_create_augroup("ClaudeChat", { clear = false })
    vim.api.nvim_create_autocmd("BufWinEnter", {})

    vim.fn.setline(1, 'System prompt: ' .. 'TODO: default system prompt')
    vim.fn.append('$', 'Next line')
  end
  claude_bufnr = vim.fn.bufnr('Claude Chat')

  -- TODO: lots
  local claude_winid = vim.fn.bufwinid(claude_bufnr)
  if claude_winid == -1 then
    vim.cmd('botright split')
    vim.cmd('buffer ' .. claude_bufnr)
  else
    vim.fn.win_gotoid(claude_winid)
  end
  -- WIP
end

return M
