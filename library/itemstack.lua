--- @meta

--- String with whitespace-separated 1-4 components: name, count, wear and metadata.
--- Metadata is serialized in a special way. It's recommended to use `ItemStack` to manipulate item metadata.
--- For example:
---   `[[default:pick_wood 1 21323 "\u0001description\u0002My worn out pick\u0003"]]`
--- @alias ItemString string

--- @class ItemTable
--- @field name string
--- @field count integer
--- @field wear integer
--- @field metadata string


--- @param inst? ItemFormat
--- @return ItemStack
function ItemStack(inst) end

--- @class ItemStackClass
ItemStack = {}

--- Stack of items.
--- @class ItemStack:ItemStackClass

--- @return boolean
function ItemStack:is_empty() end

--- @return string
function ItemStack:get_name() end

--- @param name string
--- @return boolean # Whether item was not cleared
function ItemStack:set_name(name) end

--- @return integer
function ItemStack:get_count() end

--- @param count integer
--- @return boolean # Whether item was not cleared
function ItemStack:set_count(count) end

--- @return integer
function ItemStack:get_wear() end

--- @param wear integer
--- @return boolean # Whether item was not cleared
function ItemStack:set_wear(wear) end

--- @return ItemStackMetaRef
function ItemStack:get_meta() end

--- @return string
--- 1. `description` field in item metadata
--- 2. `description` field in item definition
--- 3. item name
function ItemStack:get_description() end

--- @return string | nil # `nil` if none of these fields are set.
--------
--- 1. `short_description` field in item metadata
--- 2. `short_description` field in item definition
--- 3. First line in `description` field in item metadata
--- 4. First line in `description` field in item definition
function ItemStack:get_short_description() end

--- @return true
--- Removes all items from the stack, making it empty.
function ItemStack:clear() end

--- @param item ItemFormat
--- @return true
--- Replace the contents of this stack.
function ItemStack:replace() end

--- @return ItemString
function ItemStack:to_string() end

--- @return ItemTable
function ItemStack:to_table() end

--- @return integer
function ItemStack:get_stack_max() end

--- @return integer
--- `get_stack_max() - get_count()`
function ItemStack:get_free_space() end

--- @return boolean
--- Whether item is defined i.e. not an unknown item.
function ItemStack:is_known() end

--- @return ItemDefinition
function ItemStack:get_definition() end

--- @return ToolCapabilities
function ItemStack:get_tool_capabilities() end

--- @param wear integer # (wear = [0, 65536])
--- @return boolean # Whether item is a tool and wear is increased
--------
--- Adding wear may destroy the item.
function ItemStack:add_wear(wear) end

--- @param max_uses integer # (uses = [0, 65536])
--- @return boolean # Whether item is a tool and wear is increased
--------
--- Increases wear by one use out of `max_uses`. Adding wear may destroy the item.
--- See also: `calculateResultWear()` in `tool.cpp`
function ItemStack:add_wear_by_uses(max_uses) end

--- @param item ItemFormat
--- @return ItemStack # Leftover items
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