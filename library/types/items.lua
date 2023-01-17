--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Item handling
--]=]

--[=[
*[0,255]*.

Hardware coloring simplifies the creation of colorful textures by performing
multiplication (e.g. white-black texture applied red coloring will result in
red-black color). You can use hardware coloring if your textures same pattern
and only differ in color (e.g. colored wool blocks or dyes). This may be
preferable than creating and managing many texture files.

For nodes and items which can have a set of many colors, a palette is more
suitable. A palette is a texture, which can contain up to 256 pixels. Each pixel
is one possible color, hence a paletter can contain up to 256 colors.

When using palettes, you always provide a pixel index for the given node or
`ItemStack`. The palette is read from left to right and from top to bottom. If
the palette has less than 256 pixels, then it is stretched to contain exactly
256 pixels (after arranging the pixels to one line). The indexing starts from 0.

Examples:

* 16x16 palette, index = 0: the top left corner.
* 16x16 palette, index = 4: the fifth pixel in the first row.
* 16x16 palette, index = 16: the pixel below the top left corner.
* 16x16 palette, index = 255: the bottom right corner.
* 2 (width) x 4 (height) palette, index = 31: the top left corner. The palette
  has 8 pixels, so each pixel is stretched to 32 pixels, to ensure the total 256
  pixels.
* 2x4 palette, index = 32: the top right corner.
* 2x4 palette, index = 63: the top right corner.
* 2x4 palette, index = 64: the pixel below the top left corner.

`ItemStack` color depends on the `palette_index` field of the stack's metadata.
Node color in the map depends on the `Node.param2` value, which in turn is
interpreted accoring to its `NodeDef.paramtype2`.
]=]
--- @alias PaletteIndex integer

--[=[
*[-32767,32767]*.

In a number of places, there is a group table. Groups define the properties of a
thing (item, node, armor of entity, tool capabilities) in such a way that the
engine and other mods can can interact with the thing without actually knowing
what the thing is.

Groups are stored in a table, having the group names with keys and the group
ratings as values. Group ratings are integer values within the range
[-32767,32767].

Groups always have a rating associated with them. If there is no useful meaning
for a rating for an enabled group, it shall be `1`. When not defined, the rating
of a group defaults to `0`. Thus, when you read groups, you must interpret `nil`
and `0` as the same value.

### Groups of entities

For entities, groups are, as of now, used only for calculating damage. The
rating is the percentage of damage caused by items with this damage group.

TODO expand this

### Groups of tool capabilities

Groups in tool capabilities define which groups of nodes and entities they are
effective towards.

TODO expand this

### Special item groups

* `not_in_creative_inventory`: ✅ **Recomendation**: For inventory mods to
  indicate that the item should be hidden in item lists.

TODO last here

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
* `bouncy`: value is bounce speed in percent.
  If positive, jump/sneak on floor impact will increase/decrease bounce height.
  Negative value is the same bounciness, but non-controllable.

* `connect_to_raillike`: makes nodes of raillike drawtype with same group value
  connect to each other

* `dig_immediate`: Player can always pick up node without reducing tool wear
    * `2`: the node always gets the digging time 0.5 seconds (rail, sign)
    * `3`: the node always gets the digging time 0 seconds (torch)

* `disable_jump`: Player (and possibly other things) cannot jump from node
  or if their feet are in the node. Note: not supported for `new_move = false`

* `fall_damage_add_percent`: modifies the fall damage suffered when hitting
  the top of this node. There's also an armor group with the same name.
  The final player damage is determined by the following formula:
    damage =
      collision speed
      * ((node_fall_damage_add_percent   + 100) / 100) -- node group
      * ((player_fall_damage_add_percent + 100) / 100) -- player armor group
      - (14)                                           -- constant tolerance
  Negative damage values are discarded as no damage.

* `falling_node`: if there is no walkable block under the node it will fall

* `float`: the node will not fall through liquids (`liquidtype ~= "none"`)

* `level`: Can be used to give an additional sense of progression in the game.
     * A larger level will cause e.g. a weapon of a lower level make much less
       damage, and get worn out much faster, or not be able to get drops
       from destroyed nodes.
     * `0` is something that is directly accessible at the start of gameplay
     * There is no upper limit
     * See also: `leveldiff` in [Tool Capabilities]

* `slippery`: Players and items will slide on the node.
  Slipperiness rises steadily with `slippery` value, starting at 1.

### Special tool groups

* `disable_repair`: If set to 1 for a tool, it cannot be repaired using the
  `"toolrepair"` crafting recipe


### Special `ObjectRef` armor groups

* `immortal`: Skips all damage and breath handling for an object. This group
  will also hide the integrated HUD status bars for players. It is
  automatically set to all players when damage is disabled on the server and
  cannot be reset (subject to change).

* `fall_damage_add_percent`: Modifies the fall damage suffered by players
  when they hit the ground. It is analog to the node group with the same
  name. See the node group above for the exact calculation.

* `punch_operable`: For entities; disables the regular damage mechanism for
  players punching it by hand or a non-tool item, so that it can do something
  else than take damage.

]=]
--- *[-32767,32767]*.
--- @alias GroupRating integer

--- @class GetCraftResultIn
--- @field method '"normal"' | '"cooking"' | '"fuel"'
--- @field width integer # *[0,3]*. `0` shapeless recipes.
--- @field items ItemFormat[] # *Length = [1, 9]*. Input items.

--- @class GetCraftResultOut
--- @field item ItemStack # Empty `Itemstack` unsuccessful.
--- @field time integer # `0` unsuccessful.
--- @field replacements ItemStack[] # *Length = [1, 9]*. Replacement items that couldn't be placed in leftover item input.

--- @class GetCraftRecipeOut
--- @field method '"normal"' | '"cooking"' | '"fuel"'
--- @field width integer # *[0,3]*. `0` shapeless recipes.
--- @field items string[] # *Length = [1, 9]*. Input items.
--- @field output ItemString # Item name and quantity.

-- TODO toolcapability section class
-- TODO item metadata section class
