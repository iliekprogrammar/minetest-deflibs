--- @meta

--- @param pos Vector
--- @param range integer # Actions also in range from `pos`
--- @param since TimeUnix # Seconds since present
--- @param max_actions integer # Maximum number of actions to search
--- @return RollbackAction[]
--- Finds who has done something to a node, or near a node.
function minetest.rollback_get_node_actions(pos, range, since, max_actions) end

--- @param actor string # `"player:NAME"` or `"liquid"`
--- @param since TimeUnix # Seconds since present
--- @return boolean, string
--- Revert actions.
--- **WARNING**: Unreliable, may not rollback correctly causing unexpected results.
function minetest.rollback_revert_actions_by(actor, since) end
