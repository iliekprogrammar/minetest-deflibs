--- @meta
--[=[
References:
  * `doc/lua_api.txt` → Formspec
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
  * `doc/lua_api.txt` → 'minetest' namespace reference → Formspec
--]=]

--- @param player string
--- @param formname string # Follow `"modname:<whatever>"` convention.
--- @param formspec Formspec
--- @return boolean # `true` formspec is sent to player.
---*****
--- Sends formspec with given formname to player, displaying it.
---*****
--- @*implementation* `src/script/lua_api/l_server.cpp`
function minetest.show_formspec(player, formname, formspec) end

--- @param player string
--- @param formname string # Follow `"modname:<whatever>"` convention.
--- ⚠️ **WARNING**: `""` closes any formspec regardless of formname.
--- @return boolean # `true` formspec is sent to player.
---*****
--- Sends an empty formspec with fiven formname to player, closing it.
--- `show_formspec(player, formname, "")` is equivalent.
---*****
--- @*implementation* `builtin/game/misc.lua`
function minetest.close_formspec(player, formname) end

--- @param s string
--- @return string
--- Escapes `[]\,;$` characters not allowed in formspecs.
---*****
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.formspec_escape(s) end

--- @param field string
--- @return FieldEventTable
--- 'Explodes'/Parse `table[]` element events from field string.
---*****
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.explode_table_event(field) end

--- @param field string
--- @return FieldEventTextlist
--- 'Explodes'/Parse `textlist[]` element events from field string.
---*****
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.explode_textlist_event(field) end

--- @param field string
--- @return FieldEventScrollbar
--- 'Explodes'/Parse `scrollbar[]` element events from field string.
---*****
--- @*implementation* `builtin/common/misc_helpers.lua`
function minetest.explode_scrollbar_event(field) end

-- Register functions ----------------------------------------------------------

--- @param callback fun(player: PlayerRef, formname: string, fields: FieldEvents): boolean
--- @*callback-param* `formname` — Follow `"modname:<whatever>"` convention. \
--- @*calllback-return* — `true` skips remaining callbacks.
---*****
--- Newest callbacks are triggered first.
---
--- Registers callback triggered when server received input from `player` in a
--- formspec with the given `formname`. Specifically, this is triggered on any
--- of the following events:
---   * A button was pressed,
---   * Enter was pressed while the focus was on a text field
---   * A checkbox was toggled,
---   * Something was selected in a dropdown list,
---   * A different tab was selected,
---   * Selection was changed in a textlist or table,
---   * An entry was double-clicked in a textlist or table,
---   * A scrollbar was moved, or
---   * The form was actively closed by the player.
function minetest.register_on_player_receive_fields(callback) end

--- Registered callbacks from `minetest.register_on_player_receive_fields()`.
--- @type (fun(player: PlayerRef, formname: string, fields: FieldEvents): boolean)[]
minetest.registered_on_player_receive_fields = {}
