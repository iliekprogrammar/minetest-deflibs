--- @meta

-- TODO raycast

--- @class PointedNothing
--- @field type '"nothing"'

--- @class PointedNode
--- @field type '"node"'
--- @field under Vector # Position of pointed node.
--- @field above Vector # Position beside pointed node, facing towards pointer.

--- @class PointedEntity
--- @field type '"object"'
--- @field ref ObjectRef

--- @alias PointedThing PointedNothing | PointedNode | PointedEntity
