--- @meta

--- @param pos Vector
--- @param node Node # (Default: `node.param1 = 0`, `node.param2 = 0`)
--- @return boolean # Success
--------
--- Set node at position `pos`. Removes node metadata.
--------
--- Triggers `NodeDef.on_destruct()`, then `NodeDef.after_destruct()` callbacks of the old node.
--- Triggers `NodeDef.on_construct()` callback of the new node.
function minetest.set_node(pos, node) end

--- @param pos Vector
--- @param node Node # (Default: `node.param1 = 0`, `node.param2 = 0`)
--- @return boolean # Success
--------
--- Set node at position `pos`. Removes node metadata.
--------
--- Triggers `NodeDef.on_destruct()`, then `NodeDef.after_destruct()` callbacks of the old node.
--- Triggers `NodeDef.on_construct()` callback of the new node.
function minetest.add_node(pos, node) end

--- @param poslist Vector[]
--- @param node Node # (Default: `node.param1 = 0`, `node.param2 = 0`)
--- @return boolean # Success
--------
--- Set node on positions in `poslist`. Removes node metadata.
--- ~1.3x Faster than `minetest.set_node()`, ~20x slower than VoxelManips.
--- Variaby memory efficient compared to VoxelManips, depending on position spread and wasted VoxelManip memory.
--------
--- Triggers `NodeDef.on_destruct()`, then `NodeDef.after_destruct()` callbacks of the old nodes.
--- Triggers `NodeDef.on_construct()` callback of the new node.
function minetest.bulk_set_node(poslist, node) end

--- @param pos Vector
--- @param node Node # (Default: `node.param1 = 0`, `node.param2 = 0`)
--- @return boolean # Success
--------
--- Set node at position `pos`. Preserves node metadata.
function minetest.swap_node(pos, node) end

--- @param pos Vector
--- @return boolean # Success
--------
--- Set node at position `pos` to `air`, thereby removing the node. Removes node metadata.
--------
--- Triggers `NodeDef.on_destruct()`, then `NodeDef.after_destruct()` callbacks of the old node.
function minetest.remove_node(pos) end

--- @param pos Vector
--- @return Node # `{name="ignore", param1=0, param2=0}` in unloaded areas.
function minetest.get_node(pos) end

--- @param pos Vector
--- @return Node | nil # `nil` in unloaded areas.
function minetest.get_node_or_nil(pos) end

--- @param pos Vector
--- @param timeofday? number # (Default: present time) `0` night. `0.5` day.
--- @return integer | nil # (return = [0, 15]) `nil` in unloaded areas.
--------
--- Gets the light value at the given position.
--- Usually, light value of a neighboring position is wanted, instead of light value "inside" the node at the given position.
function minetest.get_node_light(pos, timeofday) end

--- @param pos Vector
--- @param timeofday? number # (Default: present time) `0` night. `0.5` day.
--- @return integer | nil # (return = [0, 15]) `nil` in unloaded areas.
--------
--- Gets the natural light value at the given position. Natural light depends on the time of day instead of light nodes.
--- Usually, light value of a neighboring position is wanted, instead of light value "inside" the node at the given position.
function minetest.get_natural_light(pos, timeofday) end

--- @param param1 integer # (param1 = [0, 255])
--- @return integer # (return = [0, 15])
--------
--- Gets the artificial light value from param1. Artificiaal light depends on light nodes instead of the time of day.
function minetest.get_artificial_light(param1) end

--- @param pos Vector
--- @param node Node
--- @return boolean # Success
--------
--- Place node with the same effects that a player would cause.
--------
--- 1. Triggers `ItemDef.on_place()` callback of the new node.
function minetest.place_node(pos, node) end

--- @param pos Vector
--- @return boolean # Success
--------
--- Dig node with the same effects that a player would cause.
---*****
--- 1. Triggers `NodeDef.on_dig()` callback of the node.
function minetest.dig_node(pos) end

--- @param pos Vector
--- @return boolean # Success
--------
--- Punch node with the same effects that a player would cause.
---*****
--- 1. Triggers `NodeDef.on_punch()` callback of the node.
function minetest.punch_node(pos) end

--- @param pos Vector
--- @return boolean # Success
--------
--- Remove node, then spawns a falling node.
--- **See also**: `__builtin:falling_node` entity in `builtin/game/falling.lua`
--------
--- Triggers `NodeDef.on_destruct()`, then `NodeDef.after_destruct()` callbacks of the old node.
function minetest.spawn_falling_node(pos) end

--- @param pos1 Vector
--- @param pos2 Vector
--- @return Vector[]
--- Get a table of positions of nodes that have metadata within a region.
function minetest.find_nodes_with_meta(pos1, pos2) end

--- @param pos Vector
--- @return NodeMetaRef
--------
--- Get `NodeMetaRef` at that position.
function minetest.get_meta(pos) end

--- @param pos Vector
--- @return NodeTimerRef
--------
--- Get `NodeTimerRef` at that position.
function minetest.get_node_timer(pos) end

--- @param pos Vector
--- @param radius integer
--- @param names string | string[]
--- @param search_center? boolean # Whether to search given position.
--- @return Vector | nil
--------
--- Find first matching node in cube-region from given position, searching outwards from the center.
function minetest.find_node_near(pos, radius, names, search_center) end

--- @param pos1 Vector
--- @param pos2 Vector
--- @param names string | string[]
--- @param grouped? boolean # `true` return *node name→positon* map. `false` return matching positions and match count
--- @return {[string]: Vector[]} | Vector[], nil | {[string]: integer}
--------
--- Find matching nodes in region limited to 8 mapchunks = 4,096,000 nodes.
function minetest.find_nodes_in_area(pos1, pos2, names, grouped) end

--- @param pos1 Vector
--- @param pos2 Vector
--- @param names string | string[]
--- @return Vector[]
--- Find matching nodes under air in region limited to 8 mapchunks = 4,096,000 nodes.
function minetest.find_nodes_in_area_under_air(pos1, pos2, names) end

--- @param pos Vector
--- Add node to liquid flow update queue.
function minetest.transforming_liquid_add(pos) end

--- @param pos Vector
--- @return integer # Leveled node `[0,127]`. Flowing liquid node `[0,7]`.
--------
--- Get max available level for a leveled or flowing liquid node.
function minetest.get_node_max_level(pos) end

--- @param pos Vector
--- @return integer # Leveled node `[0,127]`. Flowing liquid node `[0,7]`.
--------
--- Get level of leveled or flowing liquid node.
function minetest.get_node_level(pos) end

--- @param pos Vector
--- @param level? integer (Default: `1`)
--- @return integer # Leftover levels. Leveled node `[0,127]`. Flowing liquid node `[0,7]`. Unset leveled param2 `<0`.
--------
--- Set level of leveled or flowing liquid node.
--- `level ≤ 0` unsets `leveled` param2. `NodeDef.leveled` of the node determines the level instead.
function minetest.set_node_level(pos, level) end

--- @param pos Vector
--- @param level? integer (Default: `1`)
--- @return integer # Leftover levels. Leveled node `[0,127]`. Flowing liquid node `[0,7]`. Unset leveled param2 `<0`.
--------
--- Add level of leveled or flowing liquid node.
--- `total level ≤ 0` unsets `leveled` param2. `NodeDef.leveled` of the node determines the level instead.
function minetest.add_node_level(pos, level) end

--- @param pos Vector
--- @return boolean # Whether node falling occured or not.
--------
--- Causes an unsupported `group:falling_node` node to fall.
--- Causes an unattached `group:attached_node` node to fall.
--- Does not spread falling updates to neighbors.
function minetest.check_single_for_falling(pos) end

--- @param pos Vector
--- Causes an unsupported `group:falling_node` node to fall.
--- Causes an unattached `group:attached_node` node to fall.
--- Spread falling updates to neighbors.
function minetest.check_for_falling(pos) end

function minetest.dir_to_facedir() end

function minetest.facedir_to_dir() end

function minetest.dir_to_fourdir() end

function minetest.fourdir_to_dir() end

function minetest.dir_to_wallmounted() end

function minetest.wallmounted_to_dir() end

function minetest.is_colored_paramtype() end

function minetest.strip_param2_color() end

-- TODO maybe reference NodeDef.drop?

--- @param node Node
--- @param tool? string
--- @return string[]
--- Get items dropped by digging node using given tool.
function minetest.get_node_drops() end

function minetest.handle_node_drops() end

-- Register functions ----------------------------------------------------------

function minetest.register_node() end

minetest.registered_nodes = {}

function minetest.register_on_placenode() end

minetest.registered_on_placenodes = {}

function minetest.register_on_dignode() end

minetest.registered_on_dignodes = {}

function minetest.register_on_punchnode() end

minetest.registered_on_punchnodes = {}

function minetest.register_on_liquid_transformed() end

minetest.registered_on_liquid_transformed = {}

-- TODO: split
function minetest.hash_node_position() end

function minetest.get_position_from_hash() end

function minetest.add_entity() end

function minetest.get_player_by_name() end

function minetest.get_objects_in_area() end

function minetest.get_objects_inside_radius() end

function minetest.set_timeofday() end

function minetest.get_timeofday() end

function minetest.get_gametime() end

function minetest.get_day_count() end

function minetest.get_perlin() end

function minetest.get_voxel_manip() end

function minetest.set_gen_notify() end

function minetest.get_gen_notify() end

function minetest.get_decoration_id() end

function minetest.get_mapgen_object() end

function minetest.get_heat() end

function minetest.get_humidity() end

function minetest.get_biome_data() end

function minetest.get_biome_id() end

function minetest.get_biome_name() end

function minetest.get_mapgen_params() end

function minetest.set_mapgen_params() end

function minetest.get_mapgen_edges() end

function minetest.get_mapgen_setting() end

function minetest.get_mapgen_setting_noiseparams() end

function minetest.set_mapgen_setting() end

function minetest.set_mapgen_setting_noiseparams() end

function minetest.set_noiseparams() end

function minetest.get_noiseparams() end

function minetest.generate_ores() end

function minetest.generate_decorations() end

function minetest.clear_objects() end

function minetest.load_area() end

function minetest.emerge_area() end

function minetest.delete_area() end

function minetest.line_of_sight() end

function minetest.raycast() end

function minetest.find_path() end

function minetest.spawn_tree() end

function minetest.fix_light() end

function minetest.get_spawn_level() end
