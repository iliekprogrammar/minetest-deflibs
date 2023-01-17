--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Misc.
--]=]

--- Tweaks placement behaviour of `minetest.rotate_and_place()`.
--- @class RotateOrientFlags
--- @field invert_wall boolean # `true` place wall-orientation on the ground and ground-orientation on the wall. Mutually exclusive with `force_wall`, `force_ceiling`, `force_floor`.
--- @field force_wall boolean # `true` always place wall-orientation. Mutually exclusive with `invert_wall`, `force_ceiling`, `force_floor`.
--- @field force_ceiling boolean # `true` always place ceiling-orientation. Mutually exclusive with `invert_wall`, `force_wall`, `force_floor`.
--- @field force_floor boolean # `true` always place floor-orientation. Mutually exclusive with `invert_wall`, `force_wall`, `force_ceiling`.
--- @field force_facedir boolean # `true` reset facedir to north on the floor or ceiling.
