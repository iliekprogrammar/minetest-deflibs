Currently this library definition is updated according to Minetest API during snapshot `89e7f72c9`, within development of 5.7.0.

# Structure
`SECTION` may not reflect the official `lua_api.txt` chapters.

## `library/minetest.lua`
I don't know yet

## `library/CLASS.lua`
Defines API for the `CLASS` objects.

## `library/minetest/SECTION.lua`
Defines API under the `mietest` namespace about `SECTION` as organized in `lua_api.txt`.

## `library/minetest/SECTION.t.lua`
Defines auxiliary types for its main file, `library/minetest/SECTION.lua`.

## `library/types/SECTION.lua`
Defines definition tables and various types about `SECTION` as organized in `lua_api.txt`.
Auxiliary types may be merged here instead.

# Games and mods overriding/extending Minetest Lua API
TODO

# License: MIT
