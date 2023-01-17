--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Inventory
  * `doc/lua_api.txt` → 'minetest' namespace reference → Defaults for the `on_place` and `on_drop` item definition functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Defaults for the `on_punch` and `on_dig` item definition functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Misc.
--]=]

--- TODO swap the conditional to the begining of callback statement.

--- @param itemnode ItemStack
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param param2? Param2 # Overrides facedir and wallmounted `param2`.
--- @param prevent_after_place? boolean # `true` do not trigger `NodeDef.after_place_node()` callback.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
---*****
--- Places item as a node by given placer with given `param2`. Honors protected areas.
---*****
--- 1. Triggers `minetest.register_on_protection_violation()` callbacks and
---    callback chain stops, if position is protected. Otherwise, callback chain
---    continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.on_construct()` callback of the new node.
--- 5. Triggers `NodeDef.after_place_node()` callback of the new node, if `prevent_after_place` is `false`.
--- 6. Triggers `minetest.register_on_placenode()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place_node(itemnode, placer, pointed_thing, param2, prevent_after_place) end

--- @param item ItemStack
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @return ItemStack # Leftover items.
---*****
--- Takes an item. Spawns `__builtin:item` entity.
---*****
--- 1. Triggers `Entity:on_activate()` callback of `__builtin:item` entity.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place_object(item, placer, pointed_thing) end

--- @param item ItemStack # Can be item node or not.
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param param2? Param2 # Overrides facedir and wallmounted `param2`.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
---*****
--- Places item, if appropriate as a node, by given placer with given `param2`.
--- Honors protected area. \
--- Default `ItemDef.on_place()` callback. Setting it will override this function.
---*****
--- 1. Triggers `NodeDef.on_rightclick()` callback of the pointed node and
---    callback chain stops, if the callback is defined. Otherwise, callback chain
---    continues:
--- 2. Triggers `minetest.register_on_protection_violation()` callbacks and
---    callback chain stops, if position is protected. Otherwise, callback chain
---    continues:
--- 3. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 5. Triggers `NodeDef.on_construct()` callback of the new node.
--- 6. Triggers `NodeDef.after_place_node()` callback of the new node.
--- 7. Triggers `minetest.register_on_placenode()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place(item, placer, pointed_thing, param2) end

-- TODO: revisit Entity:on_punch() parameters

--- @param item ItemStack
--- @param picker ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedEntity # `__builtin:item` entity.
--- @param ... any # Other parameters from `Entity:on_punch()` callback of `__builtin:item` entity.
--- @return ItemStack # Item from the first callback or leftover items from default behaviour. Empty `ItemStack` removes `__builtin:item` entity.
---*****
--- Pickups item, adding to inventory list `main` of given picker. \
--- Default `ItemDef.on_pickup()` callback. Setting it will override this function.
---*****
--- 1. Triggers `minetest.register_on_item_pickup()` callbacks. Callback chain
---    stops for the first callback to return an item.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_pickup(item, picker, pointed_thing, ...) end

--- @param item ItemStack
--- @param dropper ObjectRef | nil # Can be player or not
--- @param pos Vector
--- @return ItemStack | nil # Leftover items. `nil` failure to spawn `__builtin:item` entitty.
---*****
--- Drops the item by given dropper.
--- Takes the entire item stack. Spawns `__builtin:item` entity. \
--- Default `ItemDef.on_drop()` callback. Setting it overrides this function.
---*****
--- 1. Triggers `Entity:on_activate()` callback of `__builtin:item` entity.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_drop(item, dropper, pos) end

--- @param hp_change integer # *[-65535,65535]*.
--- @param new_item? ItemFormat
--- @return fun(item: ItemStack, user: ObjectRef | nil, pointed_thing: PointedThing): ItemStack | nil # Wrapper for `minetest.do_item_eat()`.
---*****
--- Create closures for `ItemDef.on_use()` and similar callbacks for eating.
---
--- 👀 **See also**: `minetest.do_item_eat()`.
---*****
--- 1. Triggers `minetest.register_on_item_eat()` callbacks. Callback chain
---    stops for the first callback to return an item.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_eat(hp_change, new_item) end

--- @param hp_change integer # *[-65535,65535]*.
--- @param new_item ItemFormat | nil
--- @param item ItemStack
--- @param user ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @return ItemStack | nil # `ItemStack` Item from the first callback. `nil` default eat behaviour.
---*****
--- Eats item, changing user HP, adding given new item to inventory list `main`
--- of given user.
---*****
--- 1. Triggers `minetest.register_on_item_eat()` callbacks. Callback chain
---    stops for the first callback to return an item.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.do_item_eat(hp_change, new_item, item, user, pointed_thing) end

--- @param pos Vector
--- @param node Node
--- @param puncher ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedNode # Punched node.
---*****
--- Punch node by given puncher. Default: punching a node does nothing.
---*****
--- 1. Triggers `minetest.register_on_punchnode()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.node_punch(pos, node, puncher, pointed_thing) end

--- @param pos Vector
--- @param node Node
--- @param digger ObjectRef | nil # Can be player or not.
---*****
--- Checks if node can be dug, adding into inventory list `main` of given
--- digger, removes node. Honors protected areas. \
--- Default `NodeDef.on_dig()` callback. Setting it will override this function.
---*****
--- 1. Triggers `NodeDef.can_dig()` callback of the new node. If `false`,
---    callback chain stops. Otherwise, callback chain continues:
--- 2. Triggers `minetest.register_on_protection_violation()` callbacks and
---    callback chain stops, if position is protected. Otherwise, callback chain
---    continues:
--- 3. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 5. Triggers `NodeDef.after_dig_node()` callback of the new node.
--- 6. Triggers `minetest.register_on_dignode()` callbacks.
---
--- @*implementation* `builtin/game/item.lua`
function minetest.node_dig(pos, node, digger) end

--- @param itemnode ItemStack # Node capable of facedir.
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param keep_item? boolean # `true` don't take items.
--- @param orient_flags? RotateOrientFlags # Tweaks placement behavior.
--- @param prevent_after_place? boolean # `true` do not trigger `NodeDef.after_place_node()` callback.
---*****
--- Places item as a node by given placer. Attempts to predict desired
--- orientation of node. Honors protected areas.
---*****
--- 1. Triggers `minetest.register_on_protection_violation()` callbacks and
---    callback chain stops, if position is protected. Otherwise, callback chain
---    continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.on_construct()` callback of the new node.
--- 5. Triggers `NodeDef.after_place_node()` callback of the new node, if `prevent_after_place` is `false`.
--- 6. Triggers `minetest.register_on_placenode()` callbacks.
---
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.rotate_and_place(itemnode, placer, pointed_thing, keep_item, orient_flags, prevent_after_place) end

--- @param itemnode ItemStack # Node capable of facedir.
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
---*****
--- Places item as a node by given placer. Attempts to predict desired
--- orientation of node. Honors protected areas.
---
--- Wrapper around `minetest.rotate_and_place()` with the following parameters:
---   * `keep_item`: `true` creative mode enabled.
---   * `orient_flags`: `{invert_wall = true}` placer is sneaking.
---   * `prevent_after_place`: `true` always.
---*****
--- 1. Triggers `minetest.register_on_protection_violation()` callbacks and
---    callback chain stops, if position is protected. Otherwise, callback chain
---    continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.on_construct()` callback of the new node.
--- 5. Triggers `NodeDef.after_place_node()` callback of the new node, if `prevent_after_place` is `false`.
--- 6. Triggers `minetest.register_on_placenode()` callbacks.
---
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.rotate_node(itemnode, placer, pointed_thing) end
