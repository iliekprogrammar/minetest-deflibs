--- @meta

--- @param player string
--- @param formname string # Follow `"modname:<whatever>"` convention.
--- @param formspec string
--- @return boolean # Whether formspec is sent to player
function minetest.show_formspec(player, formname, formspec) end

--- @param player string
--- @param formname string # Follow `"modname:<whatever>"` convention.
--------
--- `show_formspec(playername, formname, "")` is equivalent.
--- **WARNING**: `formname = ""`  closes any formspec regardless of formname.
function minetest.close_formspec(player, formname) end

--- @param s string
--- @return string
--- Escapes any of `[]\,;` characters not allowed in formspecs.
function minetest.formspec_escape(s) end

--- @param field FieldString
--- @return FieldEventTable
function minetest.explode_table_event(field) end

--- @param field FieldString
--- @return FieldEventTextlist
function minetest.explode_textlist_event(field) end

--- @param field FieldString
--- @return FieldEventScrollbar
function minetest.explode_scrollbar_event(field) end
