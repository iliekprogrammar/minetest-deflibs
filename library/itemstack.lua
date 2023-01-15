--- @meta

--- String with whitespace-separated 1-4 components: name, count, wear and metadata.
--- Metadata is serialized in a special way. It's recommended to use `ItemStack` to manipulate item metadata.
--- For example:
---   `[[default:pick_wood 1 21323 "\u0001description\u0002My worn out pick\u0003"]]`
--- @alias ItemString string

--- @class ItemTable
--- @field name string
--- @field count integer # *[0,65535]*
--- @field wear integer # *[0,65535]*
--- @field metadata string


--- @param inst? ItemFormat
--- @return ItemStack
function ItemStack(inst) end

--- Stack of items.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
--- @class ItemStack
ItemStack = {}

--- @return boolean
--- Whether the item is empty, i.e. count is zero.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:is_empty() end

--- @return string
--- Gets item name.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_name() end

--- @param itemname string
--- @return boolean # `true` item was not cleared
---*****
--- Sets item name.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:set_name(itemname) end

--- @return integer # *[0,65535]*
---*****
--- Gets item count.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_count() end

--- @param count integer # *[0,65535]*
--- @return boolean # `true` item was not cleared
---*****
--- Sets item count.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:set_count(count) end

--- @return integer # *[0,65535]*
---*****
--- Gets item wear.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_wear() end

--- @param wear integer # *[0,65535]*
--- @return boolean # `true` item was not cleared
---*****
--- Sets item wear.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:set_wear(wear) end

--- @return ItemStackMetaRef
--- Gets item metadata.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_meta() end

--- @return string
--- Gets description from the following, in order:
---   1. `description` field in item metadata.
---   2. `description` field in item definition.
---   3. item name.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_description() end

--- @return string | nil # `nil` failure.
---*****
--- Gets description from the following, in order:
---   1. `short_description` field in item metadata.
---   2. `short_description` field in item definition.
---   3. First line in `description` field in item metadata.
---   4. First line in `description` field in item definition.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_short_description() end

--- @return true
--- Removes all items from the stack, making it empty.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:clear() end

--- @param item ItemFormat
--- @return true
--- Replace the contents of this item stack.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:replace(item) end

--- @return ItemString
--- Gets item as an `ItemString`.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:to_string() end

--- @return ItemTable
--- Gets item as an `ItemTable`.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:to_table() end

--- @return integer # *[0,65535]*
---*****
--- Gets maximum item count.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_stack_max() end

--- @return integer # *[0,65535]*
---*****
--- Gets count space available before being full: `ItemStack:get_stack_max() - ItemStack:get_count()`.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_free_space() end

--- @return boolean
--- Whether item is defined i.e. not an unknown item.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:is_known() end

--- @return ItemlikeDef # `:unknown` item definition as fallback.
---*****
--- Get item definition.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_definition() end

--- @return ToolCapability # `:` (hand) item tool capability as fallback.
---*****
--- Get item tool capability.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:get_tool_capabilities() end

--- @param wear integer # *[0,65535]*
--- @return boolean # `true` success.
---*****
--- Adding wear may destroy the item.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:add_wear(wear) end

--- @param max_uses integer # *[0,65535]*
--- @return boolean # Whether item is a tool and wear is increased
---*****
--- Increases wear by one use from `max_uses`. Adding wear may destroy the item.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:add_wear_by_uses(max_uses) end

--- @param item ItemFormat
--- @return ItemStack # Leftover items
---*****
--- Add given item stack.
---*****
--- @*implementation* `src/script/lua_api/l_item.cpp`
function ItemStack:add_item(item) end

--- @param item ItemFormat
--- @return boolean
--------
--- Whether items can fully be added/combined together.
function ItemStack:item_fits(item) end

--- @param n? integer # (Default: `1`)
--- @return ItemStack # Taken items
function ItemStack:take_item(n) end

--- @param n? integer # (Default: `1`)
--- @return ItemStack # Peeked items
function ItemStack:peek_item(n) end

--- @param other ItemStack
--- @return boolean
--- `__eq` uses this function, so `stack1 == stack2` is equivalent.
--- `stack1:to_string() == stack2:to_string()` is not reliable. Item metadata can be serialized in arbitrary order.
function ItemStack:equal(other) end

--- @alias ItemFormat ItemString | ItemTable | ItemStack
