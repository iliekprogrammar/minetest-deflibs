--- @meta
--[=[
References:
  * `doc/lua_api.txt` → Class reference → `ItemStack`
--]=]

--[=[
String with whitespace-separated 1-4 components: `name`, `count`, `wear` and `metadata`.
Metadata is serialized in a special way. It's recommended to use `ItemStack` to
manipulate item metadata. Syntax:

  `<identifier> [<count>[ <wear>[ <metadata>]]]`

Examples:

  * `"default:apple"`: 1 apple.
  * `"default:dirt 5"`: 5 dirt.
  * `"default:pick_stone"`: New stone pickaxe.
  * `"default:pick_wood 1 21323"`: Wooden pickaxe, ca. 1/3 worn out.
  * `[[default:pick_wood 1 21323 "\u0001description\u0002My worn out pick\u0003"]]`: Wooden pickaxe from the `default` mod. `count` must be 1 (pickaxe is a tool), ca. 1/3 worn out (it's a tool). `description` set to `"My worn out pick"` in its metadata.
  * `[[default:dirt 5 0 "\u0001description\u0002Special dirt\u0003"]]`: Analogous to the above example. Note how the wear is set to `0` as dirt is not a tool.
]=]
--- @alias ItemString string

--[=[
Similar to `ItemString`, table with 4 components: `name`, `count`, `wear` and `metadata`.

Examples:

  * {name="default:apple", count=1, wear=0, metadata=""}: 1 apple.
  * `{name="default:dirt", count=5, wear=0, metadata=""}`: 5 dirt.
  * `{name="default:pick_wood", count=1, wear=21323, metadata=""}`: Wooden pick about 1/3 worn out.
]=]
--- @class ItemTable
--- @field name string
--- @field count integer # *[0,65535]*.
--- @field wear integer # *[0,65535]*.
--- @field metadata string


--- @param inst? ItemFormat
--- @return ItemStack
function ItemStack(inst) end

--[=[
Items are things that can be held by players, dropped in the map and stored in
inventories. Items come in the form of item stacks, which are collections of
equal items that occupy a single inventory slot.

There are four kinds of items: nodes, tools, craftitems and none.

  * Node: Placeable item form of a node in the world's voxel grid.
  * Tool: Has a changeable wear property but cannot be stacked.
  * Craftitem: Has no special properties.
  * None: Used internally by certain special items, like `:` (hand) and `:unknown`.

Every registered node has a corresponding item form that comes along with it.
By default, this item form can be placed which will create a node in the world.
Both the 'actual' node and its item form share the same identifier, and thus can
be treated interchangeably. We usually just say 'node' to the item form of the
node as well.

Note the definition of tools is purely technical. The only really unique thing
about tools is their wear, and that's basically it. Beyond that, you can't make
any gameplay-relevant assumptions about tools or non-tools. It is perfectly
valid to register something that acts as tool in a gameplay sense as a
craftitem, and vice-versa.

### Amount and wear

All item stacks have an amount *[0,65535]*, accessed as `ItemStack:get_count()`.
Default: `1`. Tool item stacks cannot have an amount greater than 1.

Tools use a wear (damage) value *[0,65535]*, accessed as `ItemStack:get_wear()`.
Default: `0` unworn tools. `0` always for non-tools. *[1,65535]* are used for
worn tools, where a higher value stands for a higher wear. There is also a
special 'toolrepair' crafting recipe that is only available to tools.
]=]
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
--- Removes all items from the item stack, making it empty.
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

--[=[
Items and item stacks can exist in three formats: Serialized `ItemString`,
`ItemTable` table and `ItemStack`.

When an item must be passed to a function, it can usually be in any of these
formats.
]=]
--- @alias ItemFormat ItemString | ItemTable | ItemStack
