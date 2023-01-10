--- @meta

--- @param text string
function minetest.chat_send_all(text) end

--- @param name string
--- @param text string
function minetest.chat_send_player(name, text) end

--- @param name string
--- @param message string # Placeholders: @name, @message, @timestamp
--------
--- Takes player name and message, and returns the formatted string to be sent to players.
--- Used by the server to format a chat message, based on the setting `chat_message_format`.
--- Only the first occurance of each placeholder will be replaced.
function minetest.format_chat_message(name, message) end

--- @param callback fun(name: string, message: string): boolean
--- @*callback-return* boolean — `true` don't send message to other players.
function minetest.register_on_chat_message(callback) end

--- Registered callbacks from `minetest.register_on_chat_message()`
--- @type (fun(name: string, message: string): boolean)[]
minetest.registered_on_chat_messages = {}
