--- @meta

--- @param text string
--- Sends text to all players in chat.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Chat**
---
--- @*implementation* `src/script/lua_api/l_server.cpp`
function minetest.chat_send_all(text) end

--- @param playername string
--- @param text string
--- Sends text to given player in chat.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Chat**
---
--- @*implementation* `src/script/lua_api/l_server.cpp`
function minetest.chat_send_player(playername, text) end

--- @param player string
--- @param message string # Placeholders: @name, @message, @timestamp
---*****
--- Takes player name and message, and returns the formatted string to be sent
--- to players. Used by the server to format a chat message, based on the
--- setting `chat_message_format`. Only the first occurance of each placeholder
--- will be replaced.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Chat**
---
--- @*implementation* `src/script/lua_api/l_server.cpp`
function minetest.format_chat_message(player, message) end

-- Register functions ----------------------------------------------------------

--- @param callback fun(name: string, message: string): boolean
--- @*callback-return* — `true` don't send message to other players.
---*****
--- Registers callback triggered when a player submits text in chat.
---*****
--- @*documentation* `doc/lua_api.txt`
--- → **'minetest' namespace reference**
--- → **Global callback registration functions**
function minetest.register_on_chat_message(callback) end

--- @type (fun(name: string, message: string): boolean)[]
--- Registered callbacks from `minetest.register_on_chat_message()`.
minetest.registered_on_chat_messages = {}
