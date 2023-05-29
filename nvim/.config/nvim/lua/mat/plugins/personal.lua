local spotify = {
  -- dir = '~/projects/spotify.nvim/',
  'molvrr/spotify.nvim',
  -- enabled = false,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    callback = 'http://localhost:3000/spotify-nvim', -- TODO: Passar porta como argumento do Job
    client_id = os.getenv("SMUDGE_CLIENT_ID"),
    client_secret = os.getenv("SMUDGE_CLIENT_SECRET")
  }
}

local babel = { dir = '~/projects/babel.nvim/' }

local matheme =  { dir = '~/projects/matheme.nvim/' }

return {
  spotify,
  babel,
  matheme
}
