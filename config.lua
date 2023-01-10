-- config.lua
--
-- See also:
--   * https://github.com/sumneko/lua-language-server/wiki/Libraries

name = 'Minetest Lua API'
words = {}
files = {
  'init.lua',
  'mod.conf',
  'game.conf',
}
configs = {
  {
    key = 'Lua.runtime.version',
    action = 'set',
    value = 'LuaJIT',
  }
}

local constants = {
  'DIR_DELIM',
  'INIT',
}
local namespaces = {
  --'bit',
  'core',
  'dump',
  'dump2',
  --'jit',
  'minetest',
  'vector',
}
local classes = {
  'AreaStore',
  'ItemStack',
  'PcgRandom',
  'PerlinNoise',
  'PerlinNoiseMap',
  'PseudoRandom',
  'Raycast',
  'SecureRandom',
  'Settings',
  'VoxelArea',
  'VoxelManip',
}

for _,v in pairs(constants) do
  table.insert(configs, {
    key = 'Lua.diagnostics.globals',
    action = 'add',
    value = v,
  })
  table.insert(words, v)
end

for _, v in pairs(namespaces) do
  table.insert(configs, {
    key = 'Lua.diagnostics.globals',
    action = 'add',
    value = v,
  })
  table.insert(words, v .. '%.%w+')
end

for _, v in pairs(classes) do
  table.insert(configs, {
    key = 'Lua.diagnostics.globals',
    action = 'add',
    value = v,
  })
  table.insert(words, v .. '%b()')
end
