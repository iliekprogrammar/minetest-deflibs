--- @meta

--- @param location InvLocation
--- @return InvRef
function minetest.get_inventory(location) end

--- @param name string # Detached inventory name. Follow `<modname>:<inventory>` convention.
--- @param callbacks InvDetachedCallbacks
--- @param player? string # Send information to player only. By default, all players will receive this information. **NOTE**: This is a workaround and may be removed in the future.
--- @return InvRef # Detached inventory. If already exists, it is cleared.
function minetest.create_detached_inventory(name, callbacks, player) end

--- @param name string # Detached inventory name. Follow `<modname>:<inventory>` convention.
--- @return boolean # Success
function minetest.remove_detached_inventory(name) end
