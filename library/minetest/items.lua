--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Environment access
  * `doc/lua_api.txt` → 'minetest' namespace reference → Item handling
  * `doc/lua_api.txt` → 'minetest' namespace reference → Defaults for the `on_place` and `on_drop` item definition functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Misc.
--]=]

--- @param itemname string
--- @param override ItemlikeDef
--- Overrides `ItemDef` fields of given registered item with the given `ItemDef`. \
--- 📕 **NOTE**: Item must already be defined. You should depend on mods defining it.
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
--- @return GetCraftRecipeOut, GetCraftResultIn # 1. Item output. 2. Leftover item input.
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
--- @return integer # *[-32767,32767]*
--- Get rating/value of given group of given item.
---*****
--- @*implementation* `builtin/game/misc_s.lua`
function minetest.get_item_group(item, group) end

-- Defaults --------------------------------------------------------------------
-- TODO reinspect this section, much later.
-- TODO move to defaults.lua

--- @param item ItemStack # Item node.
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param param2? Param2 # Overrides facedir and wallmounted `param2`.
--- @param prevent_after_place? boolean # `true` do not trigger `NodeDef.after_place_node()` callback.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
---*****
--- Places item as a node by given placer with given `param2`.
---*****
--- 1. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 2. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.on_construct()` callback of the new node.
--- 4. Triggers `NodeDef.after_place_node()` callback of the new node, if `prevent_after_place` is `false`.
--- 5. Triggers `minetest.register_on_placenode()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place_node(item, placer, pointed_thing, param2, prevent_after_place) end

--- @param item ItemStack
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @return ItemStack # Leftover items.
---*****
--- Places item as-is by given placer.
---*****
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place_object(item, placer, pointed_thing) end

--- @param item ItemStack
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param param2? Param2 # Overrides facedir and wallmounted `param2`.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
---*****
--- Places item, if appropriate as a node, by given placer with given `param2`.
--- Default `ItemDef.on_place()` callback. Setting it will override this function.
---*****
--- 1. Triggers `NodeDef.on_rightclick()` callback of the pointed node and callback chain stops, if the callback is defined. Otherwise, callback chain continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 2. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.on_construct()` callback of the new node.
--- 4. Triggers `NodeDef.after_place_node()` callback of the new node.
--- 5. Triggers `minetest.register_on_placenode()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place(item, placer, pointed_thing, param2) end

--- @param item ItemStack
--- @param picker ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be `__builtin:item` entity or not.
--- @param ... any # Other parameters from `Entity:on_punch()` callback of `__builtin:item` entity.
--- @return ItemStack # Leftover items.
---*****
--- Pickups item, adding to inventory list `main` of given picker.
--- Removes `__builtin:item` entity.
--- Default `ItemDef.on_pickup()` callback. Setting it will override this function.
---*****
--- 1. Triggers `minetest.register_on_item_pickup()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_pickup(item, picker, pointed_thing, ...) end

--- @param item ItemStack
--- @param dropper ObjectRef | nil
--- @param pos Vector
--- @return ItemStack | nil # Leftover items. `nil` failure.
---*****
--- Drops the item by given dropper, usually a player.
--- Spawns `__builtin:item` entity. Clears the stack.
--- Default `ItemDef.on_drop()` callback. Setting it overrides this function.
---*****
--- @*implementation* `builtin/game/item.lua`
function minetest.item_drop(item, dropper, pos) end

--- @param hp_change integer # *[-65535,65535]*.
--- @param new_item? ItemFormat # Added to inventory.
--- @return fun(item: ItemStack, user: ObjectRef | nil, pointed_thing: PointedThing): ItemStack # Wrapper for `minetest.do_item_eat()`.
---*****
--- Eats item, changing user HP. Create closures for `ItemDef.on_use()` and similar callbacks.
---*****
--- 1. Triggers `minetest.register_on_item_eat()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_eat(hp_change, new_item) end

--- @param hp_change integer # *[-65535,65535]*.
--- @param new_item ItemFormat # Added to inventory.
--- @param item ItemStack
--- @param user ObjectRef | nil
--- @param pointed_thing PointedThing
--- @return ItemStack | nil # Leftover items. `nil` no inventory change.
---*****
--- Eats item, changing user HP.
---*****
--- 1. Triggers `minetest.register_on_item_eat()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.do_item_eat(hp_change, new_item, item, user, pointed_thing) end

function minetest.rotate_and_place() end

function minetest.rotate_node() end

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

--- @param callback fun(item: ItemStack, picker: ObjectRef, pointed_thing: PointedThing, since_last_punch: TimeUnix,  ...): ItemStack | nil
--- @*callback-param* `...` — Other parameters from `Entity:on_punch()` callback of `__builtin:item` entity. \
--- @*callback-return* — Leftover items.
---*****
--- Registers callback triggered by `minetest.item_pickup()` before an item is picked up.
function minetest.register_on_item_pickup(callback) end

--- @type (fun(item: ItemStack, picker: ObjectRef, pointed_thing: PointedThing, since_last_punch: TimeUnix,  ...): ItemStack | nil)[]
--- Registered callbacks from `minetest.register_on_item_pickup()`.
minetest.registered_on_item_pickups = {}

--- @param callback fun(hp_change: integer, new_item: ItemFormat, item: ItemStack, user: PlayerRef, pointed_thing PointedThing): ItemStack | nil
--- @*callback-param* hp_change — *[-65535,65535]*. \
--- @*callback-param* `new_item` — Added to inventory. \
--- @*callback-return* — Leftover items. `nil` no inventory change. Unmodified `ItemStack` cancels default behaviour (i.e. HP increase).
---*****
--- Registers callback triggered by `minetest.item_eat()` before an item is eaten.
function minetest.register_on_item_eat(callback) end

--- @type (fun(hp_change: integer, new_item: ItemFormat, item: ItemStack, user: PlayerRef, pointed_thing PointedThing): ItemStack | nil)[]
--- Registered callbacks from `minetest.register_on_item_eat()`.
minetest.registered_on_item_eats = {}

-- TODO split into other places only ~~or determine if its good to stay here~~

function minetest.inventorycube() end

function minetest.get_pointed_thing_position() end

function minetest.dir_to_facedir() end

function minetest.facedir_to_dir() end

function minetest.dir_to_fourdir() end

function minetest.fourdir_to_dir() end

function minetest.dir_to_wallmounted() end

function minetest.wallmounted_to_dir() end

function minetest.dir_to_yaw() end

function minetest.yaw_to_dir() end

function minetest.is_colored_paramtype() end

function minetest.strip_param2_color() end
