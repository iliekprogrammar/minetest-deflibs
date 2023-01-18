--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Environment access
  * `doc/lua_api.txt` → 'minetest' namespace reference → Item handling
  * `doc/lua_api.txt` → 'minetest' namespace reference → Misc.
--]=]

-- TODO last here

--- @param itemname string
--- @param override ItemlikeDef
--- Overrides `ItemDef` fields of given registered item with the given `ItemDef`. \
--- 📕 **Note**: Item must already be defined. You should depend on mods defining it.
---*****
--- @*implementation* `builtin/game/register.lua`
function minetest.override_item(itemname, override) end

--- @param itemname string
--- Unregisters item, deleting the entry from `minetest.registered_items`,
--- `minetest.registered_craftitems`, `minetest.registered_tools` and
--- `minetest.registered_nodes`.
---*****
--- @*implementation* `builtin/game/register.lua`
function minetest.unregister_item(itemname) end

--- @param pos Vector
--- @param item ItemFormat
--- @return ObjectRef | nil # `nil` failure.
---*****
--- Spawns `__builtin:item` entity.
---*****
--- 1. Triggers `Entity:on_activate()` callback of `__builtin:item` entity.
---
--- @*implementation* `src/script/lua_api/l_env.cpp`
function minetest.add_item(pos, item) end

--- @param itemsin GetCraftResultIn
--- @return GetCraftResultOut, GetCraftResultIn # 1. Item output. 2. Leftover item input.
---*****
--- @*implementation* `src/script/lua_api/l_craft.cpp`
function minetest.get_craft_result(itemsin) end

--- @param itemout string
--- @return GetCraftRecipeOut
--- Gets recently registered recipe with given item output.
---*****
--- @*implementation* `src/script/lua_api/l_craft.cpp`
function minetest.get_craft_recipe(itemout) end

--- @param itemout string
--- @return GetCraftRecipeOut[]
--- Gets recipes with given item output.
---*****
--- @*implementation* `src/script/lua_api/l_craft.cpp`
function minetest.get_all_craft_recipes(itemout) end

--- @param item ItemFormat
--- @param palette_index PaletteIndex
--- @return ItemString
---*****
--- Creates an `ItemString` containing palette index information for hardware colorization.
---*****
--- @*implementation* `builtin/game/item.lua`
function minetest.itemstring_with_palette(item, palette_index) end

--- @param item ItemFormat
--- @param color ColorString
--- @return ItemString
--- Creates an `ItemString` containing color information for hardware colorization.
---*****
--- @*implementation* `builtin/game/item.lua`
function minetest.itemstring_with_color(item, color) end

--- @param item string
--- @param group string
--- @return GroupRating
--- Get rating/value of given group of given item.
---*****
--- @*implementation* `builtin/game/misc_s.lua`
function minetest.get_item_group(item, group) end

-- Register functions ----------------------------------------------------------

--- @type {[string]: ItemlikeDef}[]
--- Registered items from `minetest.register_craftitem()`,
--- `minetest.register_tool()` and `minetest.register_node()`.
--- Additionally, builtin items registered internally like `:` (hand) and `:unknown`.
minetest.registered_items = {}

--- @param itemname string
--- @param itemdef ItemDef
--- Registers an item with given item definition.
function minetest.register_craftitem(itemname, itemdef) end

--- @type {[string]: ItemDef}[]
--- Registered items from `minetest.register_craftitem()`.
minetest.registered_craftitems = {}

--- @param toolname string
--- @param tooldef ToolDef
--- Registers an item with given item definition.
function minetest.register_tool(toolname, tooldef) end

--- @type {[string]: ToolDef}[]
--- Registered items from `minetest.register_tool()`.
minetest.registered_tools = {}

-- TODO split into other places only ~~or determine if its good to stay here~~

function minetest.inventorycube() end

function minetest.get_pointed_thing_position() end

function minetest.dir_to_yaw() end

function minetest.yaw_to_dir() end
