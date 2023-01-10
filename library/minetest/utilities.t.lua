--- @meta

--- @class GameInfo
--- @field path string
--- @field id string
--- @field title string|nil
--- @field author string|nil

--- @class PlayerInfo
--- @field address string # IP address of client.
--- @field ip_version '4' | '6' # IPv4 / IPv6.
--- @field connection_uptime integer # Seconds since client connected.
--- @field protocol_version integer # Protocol version used by client.
--- @field formspec_version integer # Supported formspec version.
--- @field lang_code string # Language code used for translation.
--- @field min_rtt number|nil # Minimum round trip time. Unset when there are no collected stats yet.
--- @field max_rtt number|nil # Maximum round trip time. Unset when there are no collected stats yet.
--- @field avg_rtt number|nil # Average round trip time. Unset when there are no collected stats yet.
--- @field min_jitter number|nil # Minimum packet time jitter. Unset when there are no collected stats yet.
--- @field max_jitter number|nil # Maximum packet time jitter. Unset when there are no collected stats yet.
--- @field avg_jitter number|nil # Average packet time jitter. Unset when there are no collected stats yet.

--- @class EngineVersion
--- @field project string # Name of the project, e.g. "Minetest".
--- @field string string # Simple version, e.g. "1.2.3-dev".
--- @field hash string # Full git version (only set if available), e.g. "1.2.3-dev-01234567-dirty".
