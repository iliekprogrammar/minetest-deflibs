--- @meta
--[=[
References:
  *
--]=]

--- @param inst? ItemFormat
--- @return ItemStack
function Vector(inst) end

--[=[
Minetest stores 3-dimensional spatial vectors in Lua as tables of 3 coordinates.
Spatial vectors are used for various things, including, but not limited to:

  * any 3D spatial vector (x/y/z-directions).
  * Euler angles aka rotational vector (pitch/yaw/roll in radians). \
    Spatial vectors have no real semantic meaning here. Therefore, most vector
    operations make no sense in this use case.

Note that they are *not* used for:

  * n-dimensional vectors where n is not 3 (ie. n=2)
  * arrays of the form `{num, num, num}`

✅ **Recommended**: Create vectors using `Vector.new()` instead of constructing
`{x = X, y = Y, z = Z}` tables. This ensures compatiility with Minetest API.

### Syntax

⚠️ **WARNING**: Do not modify the metatable for vectors `vector.metatable`!

All `vector.*` functions allow vectors `{x = X, y = Y, z = Z}` without
metatables. Returned vectors always have a metatable set.

Vectors can be indexed with numbers and allow method and operator syntax. All
these forms of addressing a vector `v` are valid: \
`v[1]`, `v[3]`, `v.x`, `v[1] = 42`, `v.y = 13`

📕 **Note**: Prefer letter over number indexing for performance and
compatibility reasons.

Operators can be used if all of the involved vectors have metatables:

  * `v1 == v2`: Whether `v1` and `v2` are identical.
  * `-v`: Additive inverse of v.
  * `v1 + v2`: Sum of both vectors.
  * `v1 - v2`: Difference of `v1` subtracted by `v2`.
  * `v * s` or `s * v`: `v` scaled by `s`.
  * `v / s`: `v` scaled by `1 / s`.
  * `tostring(v)`: Get string representation of `v`. See `Vector:to_string()`

📕 **Note**: `+` and `-` cannot be used together with scalars. See
`Vector:add()` and `Vector:subtract()`.
]=]
--- @class Vector
Vector = {}
