--- @meta

--- @class InvLocationPlayer
--- @field type string # `type = "player"`
--- @field name string

--- @class InvLocationNode
--- @field type string # `type = "node"`
--- @field pos Vector

--- @class InvLocationDetached
--- @field type string # `type = "detached"`
--- @field name string

--- @alias InvLocation InvLocationPlayer | InvLocationNode | InvLocationDetached


--- @class InvDetachedCallbacks
--- @field allow_move fun(inv: InvRef, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: PlayerRef): integer # Called when a player wants to move items inside the inventory. @return integer # Item count allowed to move.
--- @field allow_put fun(inv: InvRef, list: string, index: integer, stack: ItemStack, player: PlayerRef): integer # Called when a player wants to put something into the inventory. @return integer # Item count allowed to put. `-1` allows and keep item count.
--- @field allow_take fun(inv: InvRef, list: string, index: integer, stack: ItemStack, player: PlayerRef): integer # Called when a player wants to take something out of the inventory. @return integer # Item count allowed to take. `-1` allows and keep item count.
--- @field on_move fun(inv: InvRef, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: PlayerRef): nil # Called after a player is allowed to move items inside the inventory.
--- @field on_put fun(inv: InvRef, list: string, index: integer, stack: ItemStack, player: PlayerRef): nil # Called after a player is allowed to put something into the inventory.
--- @field on_take fun(inv: InvRef, list: string, index: integer, stack: ItemStack, player: PlayerRef): nil # Called after a player is allowed to take something out of the inventory.
