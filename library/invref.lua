
--- @meta

--- @class InvRefClass
local InvRef = {}

--- Reference to an inventory.
--- @class InvRef:InvRefClass

--- @param list string
--- @return boolean
function InvRef:is_empty(list) end

--- @param list string
--- @return integer
function InvRef:get_size(list) end

--- @param list string
--- @param size integer
--- @return boolean # Success
function InvRef:set_size(list, size) end

--- @param list string
--- @return integer
function InvRef:get_width(list) end

--- @param list string
--- @param width integer
--- @return boolean # Success
function InvRef:set_width(list, width) end

--- @param list string
--- @param i integer
--- @return ItemStack
--- Copy of item at index `i`.
function InvRef:get_stack(list, i) end

--- @param list string
--- @param i integer
--- @param item ItemFormat
--- @return boolean # Success
--------
--- Copies item into index `i`.
function InvRef:set_stack(list, i, item) end

--- @param list string
--- @return ItemStack[]
function InvRef:get_list(list) end

--- @param list string
--- @param items ItemFormat[]
--- @return boolean # Success
function InvRef:set_list(list, items) end

--- @return {[string]: ItemStack[]}
function InvRef:get_lists() end

--- @param lists {[string]: ItemFormat[]}
--- @return boolean # Success
--------
--- Size will not change.
function InvRef:set_lists(lists) end

--- @param list string
--- @param item ItemFormat
--- @return ItemStack # Leftover items
--------
--- Adds item somewhere in list.
function InvRef:add_item(list, item) end

--- @param list string
--- @param item ItemFormat
--- @return boolean
--- Whether item can be fully added to list.
function InvRef:room_for_item(list, item) end

--- @param list string
--- @param item ItemFormat # Item metadata is ignored. Use `InvRef:set_item()` with an empty `ItemStack` instead.
--- @return ItemStack # Removed items
--------
--- Take as many items from list.
function InvRef:remove_item(list, item) end

--- @return InvLocation
function InvRef:get_location() end
