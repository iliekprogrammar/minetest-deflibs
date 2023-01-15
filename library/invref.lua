--- @meta
--[=[
References:
  * `doc/lua_api.txt` → Class reference → `InvRef`
  * `doc/lua_api.txt` → 'minetest' namespace reference → Inventory
--]=]

--- Reference to an inventory.
--- @class InvRef
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
local InvRef = {}

--- @param list string
--- @return boolean
--- Whether given inventory list is empty, i.e. no items.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:is_empty(list) end

--- @param list string
--- @return integer # *[0,255]*
---*****
--- Gets given inventory list size.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:get_size(list) end

--- @param list string
--- @param size integer # *[0,255]*
--- @return boolean # Success
---*****
--- Set given inventory list size.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:set_size(list, size) end

--- @param list string
--- @return integer # *[0,255]*
---*****
--- Gets given inventory list width.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:get_width(list) end

--- @param list string
--- @param width integer # *[0,255]*
--- @return boolean # Success
---*****
--- Set given inventory list width.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:set_width(list, width) end

--- @param list string
--- @param i integer # *[0,255]*
--- @return ItemStack
---*****
--- Gets copy of item at index `i` of the given inventory list.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:get_stack(list, i) end

--- @param list string
--- @param i integer # *[0,255]*
--- @param item ItemFormat
--- @return boolean # Success
---*****
--- Copies item into index `i` of the given inventory list.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:set_stack(list, i, item) end

--- @param list string
--- @return ItemStack[]
--- Gets items of the given inventory list.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:get_list(list) end

--- @param list string
--- @param items ItemFormat[]
--- @return boolean # Success
---*****
--- Set items of the given inventory list.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:set_list(list, items) end

--- @return {[string]: ItemStack[]}
--- Gets inventory lists and their items.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:get_lists() end

--- @param lists {[string]: ItemFormat[]}
--- @return boolean # Success
---*****
--- Set inventory lists and their items. Size will not change.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:set_lists(lists) end

--- @param list string
--- @param item ItemFormat
--- @return ItemStack # Leftover items
---*****
--- Adds item somewhere in list.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:add_item(list, item) end

--- @param list string
--- @param item ItemFormat
--- @return boolean
--- Whether item can be fully added to list.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:room_for_item(list, item) end

--- @param list string
--- @param item ItemFormat
--- @return ItemStack # Removed items.
---*****
--- Take as many items from list. \
--- ⚠️ **WARNING**: Item metadata is ignored. Use `InvRef:set_item()` with an empty `ItemStack` instead.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:remove_item(list, item) end

--- @return InvLocation
--- Gets inventory location compatible with `minetest.get_inventory()`.
---*****
--- @*implementation* `src/script/lua_api/l_inventory.cpp`
function InvRef:get_location() end
