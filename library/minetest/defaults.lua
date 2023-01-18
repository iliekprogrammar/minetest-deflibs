--- @meta

--- @param itemnode ItemStack
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param param2? Param2 # Overrides facedir and wallmounted `param2`.
--- @param prevent_after_place? boolean # `true` do not trigger `NodeDef.after_place_node()` callback.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
---*****
--- Places item as a node by given placer with given `param2`. Honors protected areas.
---*****
--- #### Callback chain
--- 1. If position is protected, triggers `minetest.register_on_protection_violation()`
---    callbacks and callback chain stops. Otherwise, callback chain continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.on_construct()` callback of the new node.
--- 5. If `prevent_after_place` is `false`, triggers `NodeDef.after_place_node()` callback of the new node.
--- 6. Triggers `minetest.register_on_placenode()` callbacks.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
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
--- #### Callback chain
--- 1. Triggers `Entity:on_activate()` callback of `__builtin:item` entity.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
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
--- #### Callback chain
--- 1. If the following callback is defined, triggers `NodeDef.on_rightclick()`
---    callback of the pointed node and callback chain stops. Otherwise,
---    callback chain continues:
--- 2. If position is protected, triggers `minetest.register_on_protection_violation()`
---    callbacks and callback chain stops. Otherwise, callback chain continues:
--- 3. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 5. Triggers `NodeDef.on_construct()` callback of the new node.
--- 6. Triggers `NodeDef.after_place_node()` callback of the new node.
--- 7. Triggers `minetest.register_on_placenode()` callbacks.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_place(item, placer, pointed_thing, param2) end

-- TODO: revisit Entity:on_punch() parameters

--- @param item ItemStack
--- @param picker ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedEntity # `__builtin:item` entity.
--- @param ... any # Other parameters from `Entity:on_punch()` callback of `__builtin:item` entity.
--- @return ItemStack # `ItemStack` Item from the first callback to return or leftover items from default behaviour. Empty `ItemStack` removes `__builtin:item` entity.
---*****
--- Pickups item. Adds to inventory list `main` of given picker.
--- `minetest.register_on_item_pickup()` callbacks may override default
--- behaviour. \
--- Default `ItemDef.on_pickup()` callback. Setting it will override this function.
---*****
--- #### Callback chain
--- 1. Triggers `minetest.register_on_item_pickup()` callbacks. Callback chain
---    stops for the first callback to return an item.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_pickup(item, picker, pointed_thing, ...) end

--- @param item ItemStack
--- @param dropper ObjectRef | nil # Can be player or not
--- @param pos Vector
--- @return ItemStack | nil # Leftover items. `nil` failure to spawn `__builtin:item` entitty.
---*****
--- Drops the item by given dropper. Takes the entire item stack.
--- Spawns `__builtin:item` entity. \
--- Default `ItemDef.on_drop()` callback. Setting it overrides this function.
---*****
--- #### Callback chain
--- 1. Triggers `Entity:on_activate()` callback of `__builtin:item` entity.
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_drop(item, dropper, pos) end

--- @param hp_change integer # *[-65535,65535]*.
--- @param add_item? ItemFormat
--- @return fun(item: ItemStack, user: ObjectRef | nil, pointed_thing: PointedThing): ItemStack | nil # Wrapper around `minetest.do_item_eat()`.
---*****
--- Create closures, wrapping `minetest.do_item_eat()` for `ItemDef.on_use()`
--- and similar callbacks for eating.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.item_eat(hp_change, add_item) end

--- @param hp_change integer # *[-65535,65535]*.
--- @param add_item ItemFormat | nil
--- @param item ItemStack
--- @param user ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @return ItemStack | nil # `ItemStack` Item from the first callback to return. `nil` default eat behaviour.
---*****
--- Eats item. Change user HP. Add given new item to inventory list `main` of
--- given user. `minetest.register_on_item_eat()` callbacks may override default
--- behaviour.
---*****
--- #### Callback chain
--- 1. Triggers `minetest.register_on_item_eat()` callbacks. Callback chain
---    stops for the first callback to return an item.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_place` and `on_drop` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.do_item_eat(hp_change, add_item, item, user, pointed_thing) end

--- @param pos Vector
--- @param node Node
--- @param puncher ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedNode # Punched node.
---*****
--- Punch node by given puncher, doing nothing.
---*****
--- #### Callback chain
--- 1. Triggers `minetest.register_on_punchnode()` callbacks.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_punch` and `on_dig` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.node_punch(pos, node, puncher, pointed_thing) end

--- @param pos Vector
--- @param node Node
--- @param digger ObjectRef | nil # Can be player or not.
--- @return boolean # `false` failure to dig node.
---*****
--- Checks if node can be dug, adding into inventory list `main` of given
--- digger, removes node. Honors protected areas. \
--- Default `NodeDef.on_dig()` callback. Setting it will override this function.
---*****
--- #### Callback chain
--- 1. Triggers `NodeDef.can_dig()` callback of the node. If `false`,
---    callback chain stops. Otherwise, callback chain continues:
--- 2. If position is protected, triggers `minetest.register_on_protection_violation()`
---    callbacks and callback chain stops. Otherwise, callback chain continues:
--- 3. Triggers `NodeDef.on_destruct()` callback of the node.
--- 4. Triggers `NodeDef.after_destruct()` callback of the node.
--- 5. Triggers `NodeDef.after_dig_node()` callback of the node.
--- 6. Triggers `minetest.register_on_dignode()` callbacks.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Defaults for the `on_punch` and `on_dig` item definition functions**
---
--- @*implementation* `builtin/game/item.lua`
function minetest.node_dig(pos, node, digger) end

--- @param item_node ItemStack # Node capable of facedir.
--- @param placer ObjectRef | nil # Can be player or not.
--- @param pointed_thing PointedThing # Can be node or not.
--- @param keep_item? boolean # `true` don't take items.
--- @param orient_flags? RotateOrientFlags # Tweaks placement behavior.
--- @param prevent_after_place? boolean # `true` do not trigger `NodeDef.after_place_node()` callback.
---*****
--- Places item as a node by given placer. Attempts to predict desired
--- orientation of node. Honors protected areas.
---*****
--- 1. If position is protected, triggers `minetest.register_on_protection_violation()`
---    callbacks and callback chain stops. Otherwise, callback chain continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.on_construct()` callback of the new node.
--- 5. If `prevent_after_place` is `false`, triggers `NodeDef.after_place_node()` callback of the new node.
--- 6. Triggers `minetest.register_on_placenode()` callbacks.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Misc.**
---
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.rotate_and_place(item_node, placer, pointed_thing, keep_item, orient_flags, prevent_after_place) end

--- @param item_node ItemStack # Node capable of facedir.
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
--- #### Callback chain
--- 1. If position is protected, triggers `minetest.register_on_protection_violation()`
---    callbacks and callback chain stops. Otherwise, callback chain continues:
--- 2. Triggers `NodeDef.on_destruct()` callback of the old node.
--- 3. Triggers `NodeDef.after_destruct()` callback of the old node.
--- 4. Triggers `NodeDef.on_construct()` callback of the new node.
--- 5. If `prevent_after_place` is `false`, triggers `NodeDef.after_place_node()` callback of the new node.
--- 6. Triggers `minetest.register_on_placenode()` callbacks.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Misc.**
---
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.rotate_node(item_node, placer, pointed_thing) end

-- Register functions ----------------------------------------------------------

--- @param callback fun(item: ItemStack, picker: ObjectRef | nil, pointed_thing: PointedEntity, since_last_punch: TimeUnix,  ...: any): ItemStack | nil
--- @*callback-param* `picker` — Can be player or not. \
--- @*callback-param* `pointed_thing` — `__builtin:item` entity. \
--- @*callback-param* `...` — Other parameters from `Entity:on_punch()` callback of `__builtin:item` entity. \
--- @*callback-return* — `ItemStack` overrides default `minetest.item_pickup()` behaviour. Empty `ItemStack` removes `__builtin:item` entity.
---*****
--- Registers callback triggered by `minetest.item_pickup()` before the default
--- behaviour. Oldest callbacks are triggered first. Callback chain stops for
--- the first callback to return an item.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Global callback registration functions**
function minetest.register_on_item_pickup(callback) end

--- @type (fun(item: ItemStack, picker: ObjectRef | nil, pointed_thing: PointedEntity, since_last_punch: TimeUnix,  ...): ItemStack | nil)[]
--- Registered callbacks from `minetest.register_on_item_pickup()`.
minetest.registered_on_item_pickups = {}

--- @param callback fun(hp_change: integer, new_item: ItemFormat | nil, item: ItemStack, user: ObjectRef | nil, pointed_thing PointedThing): ItemStack | nil
--- @*callback-param* hp_change — *[-65535,65535]*. \
--- @*callback-param* `user` — Can be player or not. \
--- @*callback-param* `pointed_thing` — Can be node or not. \
--- @*callback-return* — `ItemStack` overrides default `minetest.do_item_eat()` behaviour.
---*****
--- Registers callback triggered by `minetest.do_item_eat()` before an item is
--- eaten. Callback chain stops for the first callback to return an item.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Global callback registration functions**
function minetest.register_on_item_eat(callback) end

--- @type (fun(hp_change: integer, new_item: ItemFormat | nil, item: ItemStack, user: ObjectRef | nil, pointed_thing PointedThing): ItemStack | nil)[]
---*****
--- Registered callbacks from `minetest.register_on_item_eat()`.
minetest.registered_on_item_eats = {}
