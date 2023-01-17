--- @meta
--[=[
References:
  * `doc/lua_api.txt` → Formspec
  * `doc/lua_api.txt` → Inventory
  * `doc/lua_api.txt` → 'minetest' namespace reference → Global callback registration functions
--]=]

-- TODO this part is important for formspecs

--- @class FieldEventTable
--- @field type '"INV"'|'"CHG"'|'"DCL"' # `"INV"` no row selected. `"CHG"` selected. `"DCL"` double-click.
--- @field row integer
--- @field column integer

--- @class FieldEventTextlist
--- @field type '"INV"'|'"CHG"'|'"DCL"' # `"INV"` no row selected. `"CHG"` selected. `"DCL"` double-click.
--- @field index integer

--- @class FieldEventScrollbar
--- @field type '"INV"'|'"CHG"'|'"VAL"' # `"INV"` failure. `"CHG"` changed. `"VAL"` no change.
--- @field value integer

--- Table containing each formspecs element value string, indexed by their `name`. e.g. `FieldEvents.dropdown`.
--- @class FieldEvents
--- @field animated_image? string # Index of the current frame.
--- @field button? string # `nil` not pressed. `FieldValue` user-facing button text.
--- @field image_button? string # `nil` not pressed. `FieldValue` user-facing button text.
--- @field button_exit? string # `nil` not pressed. `FieldValue` user-facing button text.
--- @field image_button_exit? string # `nil` not pressed. `FieldValue` user-facing button text.
--- @field item_image_button? string # `nil` not pressed. `FieldValue` user-facing button text.
--- @field pwdfield? string # Text in the field.
--- @field field? string # Text in the field.
--- @field textarea? string # Text in the field.
--- @field dropdown? string # Either the index or value, depending on `<index event>`.
--- @field tabheader? string # Tab index, starting with `"1"` (only if tab changed).
--- @field checkbox? string # `"true"` checked, `"false"` unchecked.
--- @field textlist? string # See `minetest.explode_textlist_event()`
--- @field table? string # See `minetest.explode_table_event()`
--- @field scrollbar? string # See `minetest.explode_scrollbar_event()`
--- @field quit? '"true"' # User actively closed the form by mouse click, keypress, through a `button_exit[]` element or `image_button_exit[]` element.
--- @field key_enter? '"true"' # User pressed the Enter key and the focus was either nowhere (closes the formspec) or on a button. 👀 **See also**: `field_close_on_enter[]` element.
--- @field key_enter_field? string # Name of text field, if `FieldEvents.key_enter = "true"` and focus was on a text field.


--[=[
Formspec defines a menu. This supports inventories, buttons, checkboxes, text
input fields, etc, and even background color. It is a string, made out of blocks
of formspec elements. Optionally, you can insert spaces and newlines between the
blocks.

Many formspec elements have a `name`, which is a unique identifier which is used
when the server receives user input. You must not use the name `"quit"` for
formspec elements.

`X` and `Y` position the formspec element relative to the top left of the menu
or container. `W` and `H` are its width and height values.

Inventories with a `player:<name>` inventory location are only sent to the
player named `<name>`.

✅ **Recommendation**: Use `minetest.formspec_escape()` when displaying text
which can contain formspec code. e.g. text set by a player.

✅ **Recommendation**: Enable the new unified coordinate system so elements uses
the unified coordinate system and have no padding or spacing in between by
default. This is highly recommended for new forms. Enabled by default if
`formspec_version[<version>]` element `<version>` ≥ `2`. \
👀 **See also**: `real_coordinates[<bool>]` element and
`doc/lua_api.txt` → *Formspec* → *Migrating to Real Coordinates*.

⚠️ **WARNING**: If the new unified coordinate system is not enabled, position and
size units are inventory slots.

⚠️ **WARNING**: Do _not_ use an element `name` starting with `key_`. Those names
are reserved to pass key press events to formspec.

⚠️ **WARNING**: Minetest allows you to add elements to every single formspec
instance using `PlayerRef:set_formspec_prepend()`, which may be the reason
backgrounds are appearing when you don't expect them to, or why things are
styled differently to normal. See `no_prepend[]` element and *Styling Formspecs*.

### Inventory locations
  * `"context"`: Selected node metadata.
  * `"current_player"`: Player to whom the menu is shown.
  * `"player:<name>"`: Any player.
  * `"nodemeta:<X>,<Y>,<Z>"`: Any node metadata.
  * `"detached:<name>"`: A detached inventory.

### Player Inventory lists
  * `"main"`: list containing the default inventory.
  * `"craft"`: list containing the craft input.
  * `"craftpreview"`: list containing the craft prediction.
  * `"craftresult"`: list containing the crafted output.
  * `"hand"`: list containing an override for the empty hand. Only used to enhance the empty hand's tool capabilities.
    * Not created automatically, use `InvRef:set_size()`. TODO what does this mean?
]=]
--- @alias Formspec string
