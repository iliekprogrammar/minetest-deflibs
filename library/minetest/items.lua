--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Environment access
  * `doc/lua_api.txt` → 'minetest' namespace reference → Item handling
  * `doc/lua_api.txt` → 'minetest' namespace reference → Misc.
--]=]

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

--- @param callback fun(item: ItemStack, picker: ObjectRef | nil, pointed_thing: PointedEntity, since_last_punch: TimeUnix,  ...): ItemStack | nil
--- @*callback-param* `picker` — Can be player or not.
--- @*callback-param* `pointed_thing` — `__builtin:item` entity.
--- @*callback-param* `...` — Other parameters from `Entity:on_punch()` callback of `__builtin:item` entity. \
--- @*callback-return* — `ItemStack` overrides default `minetest.item_pickup()` behaviour. Empty `ItemStack` removes `__builtin:item` entity.
---*****
--- Registers callback triggered by `minetest.item_pickup()` before the default
--- behaviour. Oldest callbacks are triggered first. Callback chain stops for
--- the first callback to return an item.
function minetest.register_on_item_pickup(callback) end

--- @type (fun(item: ItemStack, picker: ObjectRef | nil, pointed_thing: PointedEntity, since_last_punch: TimeUnix,  ...): ItemStack | nil)[]
--- Registered callbacks from `minetest.register_on_item_pickup()`.
minetest.registered_on_item_pickups = {}

--- @param callback fun(hp_change: integer, new_item: ItemFormat | nil, item: ItemStack, user: PlayerRef, pointed_thing PointedThing): ItemStack | nil
--- @*callback-param* hp_change — *[-65535,65535]*. \
--- @*callback-param* `user` — Can be player or not.
--- @*callback-param* `pointed_thing` — Can be node or not.
--- @*callback-return* — Leftover items. `nil` no inventory change. Unmodified `ItemStack` cancels default behaviour (i.e. HP increase).
---*****
--- Registers callback triggered by `minetest.item_eat()` before an item is
--- eaten. Oldest callbacks are triggered first. Callback chain stops for the
--- first callback to return an item.
function minetest.register_on_item_eat(callback) end

--- @type (fun(hp_change: integer, new_item: ItemFormat, item: ItemStack, user: PlayerRef, pointed_thing PointedThing): ItemFormat | nil)[]
---*****
--- Registered callbacks from `minetest.register_on_item_eat()`.
minetest.registered_on_item_eats = {}

-- TODO split into other places only ~~or determine if its good to stay here~~

function minetest.inventorycube() end

function minetest.get_pointed_thing_position() end

function minetest.dir_to_yaw() end

function minetest.yaw_to_dir() end
