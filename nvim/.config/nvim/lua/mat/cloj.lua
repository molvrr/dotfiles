local M = {}

local Job = require('plenary.job')

M.start = function()
  Job:new({ command = 'lein', args = {
    'repl',
    ':start',
    ':host',
    'localhost'
  }, cwd = '/usr/bin' }):start()
  -- Job:join()
end

return M
