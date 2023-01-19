--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Item handling
--]=]

--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

*[0,255]*. Pallete simplifies the creation of colorful textures by performing
multiplication (e.g. white-black texture applied red coloring will result in
red-black color). Palettes can be used if your textures have the same pattern
and only differ in color (e.g. colored wool nodes or dye items).

A palette is a texture, which can contain up to 256 pixels, each representing a
possible color. The palette index is read from left to right and from top to
bottom. If the palette has less than 256 pixels, then it is stretched to contain
exactly 256 pixels (after arranging the pixels to one line).

Examples:

* 16x16 palette, index = 0: the top left corner.
* 16x16 palette, index = 4: the fifth pixel in the first row.
* 16x16 palette, index = 16: the pixel below the top left corner.
* 16x16 palette, index = 255: the bottom right corner.

* 2x4 palette, index = 31: the top left corner. Each pixel is stretched to 32 pixels.
* 2x4 palette, index = 32: the top right corner.
* 2x4 palette, index = 64: the pixel below the top left corner.

`ItemStack` color depends on the `palette_index` field of the stack's metadata.

Node color in the map depends on the `Node.param2` value, which in turn is
interpreted accoring to its `NodeDef.paramtype2`.
]=]
--- @alias PaletteIndex integer

--[=[
(Default: `0`) *[-32767,32767]*. Groups always have a rating associated with
them. If there is no useful meaning for a rating for an enabled group, it shall
be `1`.

⚠️ **WARNING**: when you read groups, you must interpret `nil` and `0` as the
same value.
]=]
--- @alias GroupRating integer

--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

Groups define the properties of a thing (item, node, armor of entity, tool
capabilities) in such a way that the engine and other mods can can interact with
the thing without actually knowing what the thing is.

### Special item groups
* `not_in_creative_inventory`: ✅ **Recomendation** for inventory mods to
  indicate that the item should be hidden in item lists.
]=]
--- @alias ItemGroups {[string]: GroupRating}

-- TODO maybe move out node definition
-- TODO maybe put references

--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

Groups define the properties of a thing (item, node, armor of entity, tool
capabilities) in such a way that the engine and other mods can can interact with
the thing without actually knowing what the thing is.

### Special item groups
* `not_in_creative_inventory`: ✅ **Recomendation** for inventory mods to
  indicate that the item should be hidden in item lists.

### Special node groups

* `attached_node`: node is attached to a neighboring node. It checks whether the
  node it is attached to is walkable. If it isn't, the node will drop as an
  item.
  * `1`: if the node is wallmounted, node is attached in the wallmounted
    direction. Otherwise, node is attached to the node below.
  * `2`: if the node is facedir or 4dir, the facedir or 4dir direction is
    checked. No effect for other nodes.
  * `3`: the node is always attached to the node below.
  * `4`: the node is always attached to the node above.

* `bouncy`: value is bounce speed in percent. \
  If positive, jump/sneak on floor impact will increase/decrease bounce height.
  Negative value is the same bounciness, but non-controllable.
  TODO include bouncy calculation in `src/client/localplayer.cpp` somewhere

* `connect_to_raillike`: makes nodes of raillike drawtype with same group value
  connect to each other.
  TODO reference where this is relevant

* `dig_immediate`: Player can always pick up node without reducing tool wear
  * `2`: the node always gets the digging time 0.5 seconds.
  * `3`: the node always gets the digging time 0 seconds.
  TODO reference where this is relevant

* `disable_jump`: Player (and possibly other things) cannot jump from node
  or if their feet are in the node. Note: not supported for `new_move = false`
  TODO reference where this is relevant

* `fall_damage_add_percent`: modifies the fall damage suffered when hitting
  the top of this node. There's also an armor group with the same name.
  The final player damage is determined by the following formula:
    damage =
      collision speed
      * ((node_fall_damage_add_percent   + 100) / 100) -- node group
      * ((player_fall_damage_add_percent + 100) / 100) -- player armor group
      - (14)                                           -- constant tolerance
  Negative damage values are discarded as no damage.
  TODO split off the damage calculation elsewhere

* `falling_node`: if there is no walkable block under the node it will fall
  TODO reference where this is relevant

* `float`: the node will not fall through liquids (`liquidtype ~= "none"`)
  TODO reference where this is relevant

* `level`: Can be used to give an additional sense of progression in the game.
     * A larger level will cause e.g. a weapon of a lower level make much less
       damage, and get worn out much faster, or not be able to get drops
       from destroyed nodes.
     * `0` is something that is directly accessible at the start of gameplay
     * There is no upper limit
     * See also: `leveldiff` in [Tool Capabilities]
  TODO reference where this is relevant

* `slippery`: Players and items will slide on the node.
  Slipperiness rises steadily with `slippery` value, starting at 1.
  TODO reference where this is relevant
]=]
--- @alias NodeGroups ItemGroups

--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

Groups define the properties of a thing (item, node, armor of entity, tool
capabilities) in such a way that the engine and other mods can can interact with
the thing without actually knowing what the thing is.

### Special item groups

* `not_in_creative_inventory`: ✅ **Recomendation** for inventory mods to
  indicate that the item should be hidden in item lists.

### Special tool groups

* `disable_repair`: If set to 1 for a tool, it cannot be repaired using the
  `"toolrepair"` crafting recipe
  TODO reference where this is relevant
]=]
--- @alias ToolGroups ItemGroups

--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

Groups define the properties of a thing (item, node, armor of entity, tool
capabilities) in such a way that the engine and other mods can can interact with
the thing without actually knowing what the thing is.

For **Entity groups**, groups are used only for calculating damage. The rating
is the percentage of damage caused by items with this damage group.

👀 **See also**: `ObjectRef:set_armor_gropus()`, `ObjectRef:get_armor_gropus()`.
`minetest.get_hit_params()` for damage calculation.

### Special `ObjectRef` armor groups

* `immortal`: Skips all damage and breath handling for an object. This group
  will also hide the integrated HUD status bars for players. It is
  automatically set to all players when damage is disabled on the server and
  cannot be reset (subject to change).
  TODO reference where this is relevant

* `fall_damage_add_percent`: Modifies the fall damage suffered by players
  when they hit the ground. It is analog to the node group with the same
  name. See the node group above for the exact calculation.
  TODO reference where this is relevant

* `punch_operable`: For entities; disables the regular damage mechanism for
  players punching it by hand or a non-tool item, so that it can do something
  else than take damage.
  TODO reference where this is relevant
]=]
--- @alias ObjectRefArmorGroups {[string]: GroupRating}

--- @class ToolCapabilityGroupsSpec
--- @field maxlevel integer
--- @field uses integer
--- @field times number[]

--[=[
***Auxiliary definition***: Not documented or used in Minetest Lua API.

Groups define the properties of a thing (item, node, armor of entity, tool
capabilities) in such a way that the engine and other mods can can interact with
the thing without actually knowing what the thing is.

For **Tool capability groups**, groups in tool capabilities define which groups
  of nodes and entities they are effective towards.

👀 **See also**: `ToolDef.tool_capabilitie.groupcapss`. `minetest.get_hit_params()` fo
damage and wear calculation. `minetest.get_dig_param()` for digging time an
wear calculation.
]=]
--- @alias ToolCapabilityGroups {[string]: ToolCapabilityGroupsSpec}

--- @class ToolCapability
--- @field groupcaps ToolCapabilityGroups

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class GetCraftResultIn
--- @field method '"normal"' | '"cooking"' | '"fuel"'
--- @field width integer # *[0,3]*. `0` shapeless recipes.
--- @field items ItemFormat[] # *Length = [1, 9]*. Input items.

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class GetCraftResultOut
--- @field item ItemStack # Empty `Itemstack` unsuccessful.
--- @field time integer # `0` unsuccessful.
--- @field replacements ItemStack[] # *Length = [1, 9]*. Replacement items that couldn't be placed in leftover item input.

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @class GetCraftRecipeOut
--- @field method '"normal"' | '"cooking"' | '"fuel"'
--- @field width integer # *[0,3]*. `0` shapeless recipes.
--- @field items string[] # *Length = [1, 9]*. Input items.
--- @field output ItemString # Item name and quantity.

-- TODO toolcapability section class
-- TODO item metadata section class

-- Definition tables -----------------------------------------------------------

-- TODO basic definition table documentation.
-- TODO better definition table documentation.

--- @class ItemDef
--- @field description? string # Can contain new lines. "\n" has to be used as new line character. 👀 **See also**: `ItemStack:get_description()`.
--- @field short_description? string # Cannot contain new lines. 👀 **See also**: `ItemStack:get_short_description()`*
--- @field groups? ItemGroups
--- @field inventory_image? string # (Default: 3D render of node) Texture shown in the inventory GUI.
--- @field inventory_overlay? string # An overlay texture which is not affected by colorization.
--- @field wield_image? string # (Default: 3D render of node) Texture shown when item is held in hand.
--- @field wield_overlay? string # An overlay texture which is not affected by colorization.
--- @field wield_scale? string # Scale for the item when held in hand.
--- @field palette? string # An image file containing the palette.

--- @class NodeDef:ItemDef

--- @class ToolDef:ItemDef

--- ***Auxiliary definition***: Not documented or used in Minetest Lua API.
---
--- @alias ItemlikeDef ItemDef | NodeDef | ToolDef
