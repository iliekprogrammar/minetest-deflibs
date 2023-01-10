--- @meta

--- @param channel_name string
--- Server joins channel `channel_name`, and creates it if necessary.
--- You should listen for incoming messages with `minetest.register_on_modchannel_message()`
--- **See also**: [mod channel communication scheme](https://raw.githubusercontent.com/minetest/minetest/master/doc/mod_channels.png).
function minetest.mod_channel_join(channel_name) end

--- @param callback fun(channel_name: string, sender: string, message: string)
--- Called when an incoming mod channel message is received You should have joined some channels to receive events.
--- If message comes from a server mod, `sender` field is an empty string.
--- **See also**: [mod channel communication scheme](https://raw.githubusercontent.com/minetest/minetest/master/doc/mod_channels.png).
function minetest.register_on_modchannel_message(callback) end
