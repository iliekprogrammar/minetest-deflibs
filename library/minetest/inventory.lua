--- @meta
--[=[
References:
  * `doc/lua_api.txt` → Class reference → `InvRef`
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Inventory
--]=]

--- @param location InvLocation
--- @return InvRef | nil # `nil` failure.
---*****
--- Gets `InvRef` of the given inventory location.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function minetest.get_inventory(location) end

--- @param invname string # Detached inventory name. Follow `<modname>:<inventory>` convention.
--- @param callbacks InvDetachedCallbacks
--- @param player? string # Send information to player only. By default, all players will receive this information.
--- 📕 **NOTE**: This is a workaround and may be removed in the future.
--- @return InvRef # Detached inventory. If already exists, it is cleared.
---*****
--- Creates a detached inventory
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function minetest.create_detached_inventory(invname, callbacks, player) end

--- @param invname string # Detached inventory name. Follow `<modname>:<inventory>` convention.
--- @return boolean # Success
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function minetest.remove_detached_inventory(invname) end

-- Register functions ----------------------------------------------------------

--- @param callback fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil
--- @*callback-param* `inv` — Crafting inventory, would no longer contain input items. \
--- @*callback-return* — `ItemStack` predicts output item. `nil` keeps output item prediction.
---*****
--- Registers callback triggered when predicting crafting output. Should not modify any items.
function minetest.register_craft_predict(callback) end

--- @type (fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil)[]
--- Registered callbacks from `minetest.register_craft_predict()`.
minetest.registered_craft_predicts = {}

--- @param callback fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil
--- @*callback-param* `inv` — Crafting inventory, no longer containing input items. \
--- @*callback-return* — `ItemStack` replaces output item. `nil` keeps output item.
---*****
--- Registers callback triggered when crafting.
function minetest.register_on_craft(callback) end

--- @type (fun(itemout: ItemStack, player: PlayerRef, itemsin: ItemStack[], inv: InvRef): ItemStack | nil)[]
--- Registered callbacks from `minetest.register_on_craft()`.
minetest.registered_on_crafts = {}

--- @param callback fun(player: PlayerRef, action: InventoryActionEnum, inventory: InvRef, info: InventoryActionInfo)
--- @*callback-param* `action` — Determines which `info` table wil be used:
---   * `"move"` → `InventoryActionInfoMove`
---   * `"put" or "take"` → `InventoryActionInfoPutTake`
---*****
--- Register callbacks triggered when determining how much of a stack may be
--- taken, put or moved to a player inventory.
function minetest.register_allow_player_inventory_action(callback) end

--- @type (fun(player: PlayerRef, action: InventoryActionEnum, inventory: InvRef, info: InventoryActionInfo))[]
--- Registered callback from `minetest.register_allow_player_inventory_action()`.
minetest.registered_allow_player_inventory_actions = {}
