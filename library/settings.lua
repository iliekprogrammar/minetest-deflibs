--- @meta

--- @param file string
--- @return Settings
--- An interface to read config files in the format of `minetest.conf`.
function Settings(file) end

--- @class SettingsClass
Settings = {}

--- @class Settings:SettingsClass

--- @param key string
--- @return string
function Settings:get(key) end

--- @generic T
--- @param key string
--- @param default? T # Value returned if `key` is not found.
--- @return string|T
function Settings:get_bool(key, default) end

--- @param key string
--- @return NoiseParams
function Settings:get_np_group(key) end

--- @param key string
--- @return {[string]: boolean}
function Settings:get_flags(key) end

--- @generic T
--- @param key string # Can't contain whitespace, any of `="{}#` or `\n"""` sequence. Keys starting with `secure` can't be set on the main `Settings` instance, `minetest.settings`.
--- @param value T
function Settings:set(key, value) end

--- @param key string # Can't contain whitespace, any of `="{}#` or `\n"""` sequence. Keys starting with `secure` can't be set on the main `Settings` instance, `minetest.settings`.
--- @param value boolean
function Settings:set_bool(key, value) end

--- @param key string # Can't contain whitespace, any of `="{}#` or `\n"""` sequence. Keys starting with `secure` can't be set on the main `Settings` instance, `minetest.settings`.
--- @param value NoiseParams
function Settings:set_np_group(key, value) end

--- @param key string
--- @return boolean # Success
function Settings:remove(key) end

--- @return string[]
function Settings:get_names() end

--- @return boolean # Success
--------
--- Write changes to file
function Settings:write() end

--- @return {[string]: string}
function Settings:to_table(key) end
