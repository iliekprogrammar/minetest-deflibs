--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Inventory
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
--]=]

--- @class InvLocationPlayer
--- @field type string # `type = "player"`
--- @field name string

--- @class InvLocationNode
--- @field type string # `type = "node"`
--- @field pos Vector

--- @class InvLocationDetached
--- @field type string # `type = "detached"`
--- @field name string

--- One of 3 tables:
---   * `InvLocationPlayer`: `{type = "player", name: string}`
---   * `InvLocationNode`: `{type = "node", pos: Vector}`
---   * `InvLocationDetached`: `{type = "detached", name: string}`
--- @alias InvLocation InvLocationPlayer | InvLocationNode | InvLocationDetached


--[=[
### Player Inventory lists
  * `"main"`: list containing the default inventory.
  * `"craft"`: list containing the craft input.
  * `"craftpreview"`: list containing the craft prediction.
  * `"craftresult"`: list containing the crafted output.
  * `"hand"`: list containing an override for the empty hand. Only used to enhance the empty hand's tool capabilities.
    * Not created automatically, use `InvRef:set_size()`. TODO what does this mean?
]=]
--- @alias InvList string


--- @alias InventoryActionEnum
---| '"move"'
---| '"put"'
---| '"take"'

--- @class InventoryActionInfoMove
--- @field from_list string
--- @field to_list string
--- @field from_index integer
--- @field to_integer integer
--- @field count integer

--- @class InventoryActionInfoPutTake
--- @field listname string
--- @field index integer
--- @field stack ItemStack

--- @alias InventoryActionInfo InventoryActionInfoMove | InventoryActionInfoPutTake


--- @class InvDetachedCallbacks
local InvDetachedCallbacks = {}


--- @param inv InvRef
--- @param from_list string
--- @param from_index integer
--- @param to_list string
--- @param to_index integer
--- @param count integer
--- @param player PlayerRef
--- @return integer # Item count allowed to move.
---*****
--- Called when a player wants to move items inside the inventory.
function InvDetachedCallbacks.allow_move(inv, from_list, from_index, to_list, to_index, count, player) end

--- @param inv InvRef
--- @param list string
--- @param index integer
--- @param stack ItemStack
--- @param player PlayerRef
--- @return integer # Item count allowed to put. `-1` allows and keeps item count.
---*****
--- Called when a player wants to put something into the inventory.
function InvDetachedCallbacks.allow_put(inv, list, index, stack, player) end

--- @param inv InvRef
--- @param list string
--- @param index integer
--- @param stack ItemStack
--- @param player PlayerRef
--- @return integer # Item count allowed to take. `-1` allows and keeps item count.
---*****
--- Called when a player wants to take something out of the inventory.
function InvDetachedCallbacks.allow_take(inv, list, index, stack, player) end

--- @param inv InvRef
--- @param from_list string
--- @param from_index integer
--- @param to_list string
--- @param to_index integer
--- @param count integer
--- @param player PlayerRef
---*****
--- Called after a player is allowed to move items inside the inventory.
function InvDetachedCallbacks.on_move(inv, from_list, from_index, to_list, to_index, count, player) end

--- @param inv InvRef
--- @param list string
--- @param index integer
--- @param stack ItemStack
--- @param player PlayerRef
---*****
--- Called after a player is allowed to put something into the inventory.
function InvDetachedCallbacks.on_put(inv, list, index, stack, player) end

--- @param inv InvRef
--- @param list string
--- @param index integer
--- @param stack ItemStack
--- @param player PlayerRef
---*****
--- Called after a player is allowed to take something out of the inventory.
function InvDetachedCallbacks.on_take(inv, list, index, stack, player) end
