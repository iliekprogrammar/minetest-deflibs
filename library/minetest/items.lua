--- @meta

--- @param item ItemStack
--- @param placer ObjectRef | nil
--- @param pointed_thing PointedThing
--- @param param2? integer # Overrides facedir and wallmounted `param2`.
--- @param prevent_after_place? boolean # `true` do not trigger `after_place_node()` callback.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
--------
--- Places item as a node.
function minetest.item_place_node(item, placer, pointed_thing, param2, prevent_after_place) end

--- @param item ItemStack
--- @param placer ObjectRef | nil
--- @param pointed_thing PointedThing
--- @return ItemStack # Leftover items
--------
--- Places item as-is.
function minetest.item_place_object(item, placer, pointed_thing) end

--- @param item ItemStack
--- @param placer ObjectRef | nil
--- @param pointed_thing PointedThing
--- @param param2? integer # Overrides facedir and wallmounted `param2`.
--- @return ItemStack, Vector | nil # 1. Leftover items. 2. Placed node position. `nil` not placed.
--------
--- Places item, if appropriate as a node. If defined, calls pointed node `on_rightclick()` callback instead.
--- Default `ItemDefinition.on_place()` callback. Setting it overrides this function.
function minetest.item_place(item, placer, pointed_thing, param2) end

--- @param item ItemStack
--- @param picker ObjectRef | nil
--- @param pointed_thing PointedThing
--- @param ... any # Other parameters from `luaentity:on_punch()` callback.
--- @return ItemStack # Leftover items.
--------
--- Pickups item, adding to inventory list `main`.
--- Triggers `minetest.register_on_item_pickup()` callbacks before an item is picked up.
--- Default `ItemDefinition.on_pickup()` callback. Setting it overrides this function.
function minetest.item_pickup(item, picker, pointed_thing, ...) end

--- @param item ItemStack
--- @param dropper ObjectRef | nil
--- @param pos Vector
--- @return ItemStack # Leftover items.
--------
--- Drops the item.
--- Default `ItemDefinition.on_drop()` callback. Setting it overrides this function.
function minetest.item_drop(item, dropper, pos) end

--- @param hp_change integer
--- @param new_item? ItemString # Added to inventory.
--- @return fun(item: ItemStack, user: ObjectRef | nil, pointed_thing: PointedThing): ItemStack # Wrapper for `minetest.do_item_eat()`.
--------
--- Eats item, changing user HP.
--- Triggers `minetest.register_on_item_eat()` callbacks.
function minetest.item_eat(hp_change, new_item) end

--- @param hp_change integer
--- @param new_item ItemString # Added to inventory.
--- @param item ItemStack
--- @param user ObjectRef | nil
--- @param pointed_thing PointedThing
--- @return ItemStack | nil # Leftover items. `nil` indicates no inventory change.
--------
--- Eats item, changing user HP.
function minetest.do_item_eat(hp_change, new_item, item, user, pointed_thing) end

-- Register functions ----------------------------------------------------------

--- @param callback fun(item: ItemStack, picker: ObjectRef, pointed_thing: PointedThing, since_last_punch: TimeUnix,  ...): ItemStack
--- @*callback-param* `...` — Other parameters from `luaentity:on_punch()` callback.
--- @*callback-return* — Leftover items.
--------
--- Called by `minetest.item_pickup()` before an item is picked up.
function minetest.register_on_item_pickup(callback) end

--- Registered callbacks from `minetest.register_on_item_pickup()`.
--- @type (fun(item: ItemStack, picker: ObjectRef, pointed_thing: PointedThing, since_last_punch: TimeUnix,  ...): ItemStack)[]
minetest.registered_on_item_pickups = {}

--- @param callback fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil
--- @*callback-param* `inv` — Crafting inventory, no longer containing input items.
--- @*callback-return* — `ItemStack` replaces output item. `nil` keeps output item.
--------
--- Called when a player crafts something.
function minetest.register_on_craft(callback) end

--- Registered callbacks from `minetest.register_on_craft()`.
--- @type (fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil)[]
minetest.registered_on_crafts = {}

--- @param callback fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil
--- @*callback-param* `inv` — Crafting inventory, would no longer contain input items.
--- @*callback-return* — `ItemStack` predicts output item. `nil` keeps output item prediction.
--------
--- Called to make crafting predictions. Should not modify any items.
function minetest.register_craft_predict(callback) end

--- Registered callbacks from `minetest.register_craft_predict()`.
--- @type (fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil)[]
minetest.registered_craft_predicts = {}

-- TODO: move these to nodes.lua
--- @param pos Vector
--- @param node Node
--- @param puncher ObjectRef | nil
--- @param pointed_thing PointedThing
--- Calls functions registered by `minetest.register_on_punchnode()`.
function minetest.node_punch(pos, node, puncher, pointed_thing) end

--- @param pos Vector
--- @param node Node
--- @param digger ObjectRef | nil
--- Checks if node can be dug, puts item into inventory, removes node.
--- Calls functions registered by `minetest.register_on_dignodes()`.
function minetest.node_dig(pos, node, digger) end
