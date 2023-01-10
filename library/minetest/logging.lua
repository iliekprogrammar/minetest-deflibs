--- @meta

--- @param ... string
--- Equivalent to `minetest.log(table.concat({...}, "\t"))`
function minetest.debug(...) end

--- @param level LogLevel # (Default: `"none"`)
--- @param test string
--- @overload fun(text: string)
function minetest.log(level, text) end
