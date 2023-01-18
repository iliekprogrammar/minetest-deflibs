--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Inventory
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
--]=]

-- TODO determine whether these are auxiliary or not.
-- TODO wrte a brief about InvLocation*

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class InvLocationPlayer
--- @field type string # `type = "player"`
--- @field name string

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class InvLocationNode
--- @field type string # `type = "node"`
--- @field pos Vector

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class InvLocationDetached
--- @field type string # `type = "detached"`
--- @field name string

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- Inventory location of a player, node or detached. Represented by one of 3 tables:
---   * `InvLocationPlayer`: `{type = "player", name: string}`
---   * `InvLocationNode`: `{type = "node", pos: Vector}`
---   * `InvLocationDetached`: `{type = "detached", name: string}`
--- @alias InvLocation InvLocationPlayer | InvLocationNode | InvLocationDetached


--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

### Player Inventory lists
  * `"main"`: list containing the default inventory.
  * `"craft"`: list containing the craft input.
  * `"craftpreview"`: list containing the craft prediction.
  * `"craftresult"`: list containing the crafted output.
  * `"hand"`: list containing an override for the empty hand. Only used to enhance the empty hand's tool capabilities.
    * Not created automatically, use `InvRef:set_size()`. TODO what does this mean?
]=]
--- @alias InvList string

-- TODO brief for InvAction*

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @alias InvAction
---| '"move"'
---| '"put"'
---| '"take"'

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class InvActionInfoMove
--- @field from_list string
--- @field to_list string
--- @field from_index integer
--- @field to_integer integer
--- @field count integer

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class InvActionInfoPutTake
--- @field listname string
--- @field index integer
--- @field stack ItemStack

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @alias InvActionInfo InvActionInfoMove | InvActionInfoPutTake


--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
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
