--- @meta

--- @param channel_name string
--- Server joins channel `channel_name`, and creates it if necessary. Listen for incoming messages with `minetest.register_on_modchannel_message()`. \
--- 👀 **See also**: [mod channel communication scheme](https://raw.githubusercontent.com/minetest/minetest/master/doc/mod_channels.png).
function minetest.mod_channel_join(channel_name) end

-- Register functions ----------------------------------------------------------

--- @param callback fun(channel_name: string, sender: string, message: string)
--- @*callback-param* `sender` — Empty string if message from server-side mod.
---
--------
--- Called when an incoming mod channel message is received. Join channels to receive events with `minetest.mod_channel_join()`. \
--- 👀 **See also**: [mod channel communication scheme](https://raw.githubusercontent.com/minetest/minetest/master/doc/mod_channels.png).
function minetest.register_on_modchannel_message(callback) end

--- @type (fun(channel_name: string, sender: string, message: string))[]
--- Registered callbacks from `minetest.register_on_modchannel_message()`.
minetest.registered_on_modchannel_message = {}
