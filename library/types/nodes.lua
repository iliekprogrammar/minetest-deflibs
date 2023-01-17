--- @meta

--[=[
Nodes are the bulk data of the world: cubes and other things that take the space
of a cube. Huge amounts of them are handled efficiently, but they are quite
static.

Every registered node has a corresponding item form that comes along with it.
By default, this item form can be placed which will create a node in the world.
Both the 'actual' node and its item form share the same identifier, and thus can
be treated interchangeably. We usually just say 'node' to the item form of the
node as well.
]=]
--- @class Node
--- @field name string
--- @field param Param
--- @field param2 Param2

--- *[0,255]*. Use is determined by `NodeDef.paramtype`.
--- @alias Param integer

--- *[0,255]*. Use is determined by `NodeDef.paramtype2`.
--- @alias Param2 integer

-- TODO node metadata section class
