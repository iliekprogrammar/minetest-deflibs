--- @meta
--[=[
References:
  * `doc/lua_api.txt` → 'minetest' namespace reference → Item handling
--]=]

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
