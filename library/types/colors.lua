--- @meta

--[=[
`#RGB` and `#RRGGBB` defines a color in hexadecimal format. \
`#RGBA` and `#RRGGBBAA` defines a color in hexadecimal format and alpha channel.

Alpha channel can be set for named colours by appending with `#AA`, i.e. `green#7F`.

👀 **See also**: [CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/#named-color).
]=]
--- @alias ColorString string

--- Raw integer value of an ARGB quad, i.e. 0xFF00FF00 (green)
--- @alias ColorSpecQuad integer

--- Each element *[0,255]*. Default: `255`.
--- @alias ColorSpecTable { a: integer, r: integer, g: integer, b: integer }

--- Specifies 32-bit color in either `ColorString` string form, `ColorSpecQuad` integer form, or table.
--- @alias ColorSpec ColorSpecTable | ColorSpecQuad | ColorString
