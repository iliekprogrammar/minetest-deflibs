---@meta

--- @return string # Currently loading mod's name, when loading a mod.
function minetest.get_current_modname() end

--- @param modname string
--- @return string # Directory path for a mod, e.g. `"/home/user/.minetest/usermods/modname"`, assuming mod is enabled.
--------
--- Returns nil if mod is not enable or does not exist (not installed).
--- Useful for loading additional `.lua` modules or static data from a mod, or checking if a mod is enabled.
function minetest.get_modpath(modname) end

--- @return string[] # Enabled mods, sorted alphabetically. Does not include disabled mods, even if they are installed.
function minetest.get_modnames() end

--- @return GameInfo
--- Other information can be manually read from `game.conf` in the game's root directory.
function minetest.get_game_info() end

--- @return string # e.g. `"/home/user/.minetest/world"`. Useful for storing custom data.
function minetest.get_worldpath() end

--- @return boolean
function minetest.is_singleplayer() end

--- API feature flags.
--- @type { [string]: boolean }
minetest.features = {
  --- (0.4.7)
  glasslike_framed = true,

  --- (0.4.7)
  nodebox_as_selectionbox = true,

  --- (0.4.7)
  get_all_craft_recipes_works = true,

  --- (0.4.7) The transparency channel of textures can optionally be used on nodes.
  use_texture_alpha = true,

  --- (0.4.8) Tree and grass ABMs are no longer done from C++.
  no_legacy_abms = true,

  --- (0.4.11) Texture grouping is possible using parentheses.
  texture_names_parens = true,

  --- (0.4.14) Unique Area ID for `AreaStore:insert_area()`.
  area_store_custom_ids = true,

  --- (0.4.16) add_entity supports passing initial staticdata to on_activate.
  add_entity_with_staticdata = true,

  --- (0.4.16) Chat messages are no longer predicted.
  no_chat_message_prediction = true,

  --- (5.0.0) The transparency channel of textures can optionally be used on objects.
  --- (i.e.: players and lua entities)
  object_use_texture_alpha = true,

  --- (5.0.0) Object selectionbox is settable independently from collisionbox.
  object_independent_selectionbox = true,

  --- (5.1.0) Specifies whether binary data can be uploaded or downloaded using the HTTP API.
  httpfetch_binary_data = true,

  --- (5.1.0) Whether `formspec_version[<version>]` may be used.
  formspec_version_element = true,

  --- (5.1.0) Whether AreaStore's IDs are kept on save/load.
  area_store_persistent_ids = true,

  --- (5.2.0) Whether `minetest.find_path()` is functional.
  pathfinder_works = true,

  --- (5.3.0) Whether Collision info is available to an objects' `on_step()`.
  object_step_has_moveresult = true,

  --- (5.4.0) Whether `get_velocity()` and `add_velocity()` can be used on players.
  direct_velocity_on_players = true,

  --- (5.4.0) Node definition `use_texture_alpha` accepts new string modes.
  use_texture_alpha_string_modes = true,

  --- (5.5.0) Node definition `param2 = 'degrotate'` rotates in units of 1.5° instead of 2°,
  --- thus changing the range of values from 0-179 to 0-240.
  degrotate_240_steps = true,

  --- (5.5.0) ABM supports `min_y` and `max_y` fields in definition.
  abm_min_max_y = true,

  --- (5.5.0) `minetest.dynamic_add_media()` supports passing a table with options.
  dynamic_add_media_table = true,

  --- (5.6.0) particlespawners support texpools and animation of properties.
  --- Particle textures support smooth fade and scale animations.
  --- Sprite-sheet particle animations can by synced to the lifetime of individual particles.
  particlespawner_tweenable = true,

  --- (5.6.0) allows `minetest.get_sky()` to return a table instead of separate values.
  get_sky_as_table = true,

  --- (5.7.0) `VoxelManip:get_light_data()` accepts an optional buffer argument.
  get_light_data_buffer = true,

  --- (5.7.0) When using a mod storage backend that is not "files" or "dummy",
  --- the amount of data in mod storage is not constrained by the amount of RAM available.
  mod_storage_on_disk = true,

  --- (5.7.0) "zstd" method for compress/decompress.
  compress_zstd = true,
}

--- @param arg string | { [string]: boolean } # Features to check
--- @return boolean, { [string]: boolean } # Missing features
function minetest.has_feature(arg) end

--- @param player_name string
--- @return PlayerInfo
function minetest.get_player_information(player_name) end

--- @param path string
--- @return boolean # Success
--------
--- Creates a directory specified by `path`, creating parent directories if they don't exist.
function minetest.mkdir(path) end

--- @param path string
--- @param recursive boolean # Whether the directory is recurively removed. Otherwise, the directory will only be removed if it is empty.
--- @return boolean # Success
function minetest.rmdir(path, recursive) end

--- @param source string
--- @param destination string
--- @return boolean # Success
--------
--- Copies a directory specified by `path` to `destination`. Any files in `destination` will be overwritten if they already exist.
function minetest.cpdir(source, destination) end

--- @param source string
--- @param destination string
--- @return boolean # Success
--------
--- Moves a directory specified by `path` to `destination`. If the `destination` is a non-empty directory, then the move will fail.
function minetest.mvdir(source, destination) end

--- @param path string
--- @param is_dir? boolean # `nil`: All entries. `true`: Only subdirectory names. `false`: Only file names.
--- @return string[] # Entry names.
function minetest.get_dir_list(path, is_dir) end

--- @param path string
--- @param content string
--- @return boolean # Success
--------
--- Replaces contents of file at path with new contents in a safe (atomic) way.
--- Use this instead of below code when writing e.g. database files:
---   `local f = io.open(path, "wb"); f:write(content); f:close()`
function minetest.safe_file_write(path, content) end

--- @return EngineVersion
--- Use this for informational purposes only.
--- The information in the returned table does not represent the capabilities of the engine, nor is it reliable or verifiable.
--- Compatible forks will have a different name and version entirely.
---
--- To check for the presence of engine features, test whether the functions exported by the wanted features exist. For example:
---   `if minetest.check_for_falling then ... end`.
function minetest.get_version() end

--- @param data string
--- @param raw boolean # Whether to return raw bytes instead of hex digits.
--- @return string
function minetest.sha1(data, raw) end

--- @param colorspec ColorSpec|ColorStringCssNames
--- @return ColorString|nil # `nil`: Invalid `ColorSpec`
function minetest.colorspec_to_colorstring(colorspec) end

--- @param colorspec ColorSpec|ColorStringCssNames
--- @return string # raw string of four bytes in an RGBA layout.
function minetest.colorspec_to_bytes(colorspec) end

--- @param width integer
--- @param height integer
--- @param data ColorSpec[] | string # `ColorSpec[]`: Length must be width*height. `string`: Raw RGBA pixels, length must be width*height*4.
--- @param compression? integer # (compression = [0,9]) zlib compression level
--- @return string # Encoded PNG image
--------
--- The data is one-dimensional, starting in the upper left corner of the image and laid out in scanlines going from left to right, then top to bottom.
---
--- Please note that it's not safe to use `string.char()` to generate raw data, use `minetest.colorspec_to_bytes` to generate raw RGBA values in a predictable way.
function minetest.encode_png(width, height, data, compression) end
