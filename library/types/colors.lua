--- @meta

--- Alpha channel can be set for named colours by appending with `#AA`, i.e. `green#7F`. \
--- 👀 **See also**: [CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/#named-color).
--- @alias ColorString string

--- Raw integer value of an ARGB quad, i.e. 0xFF00FF00 (green)
--- @alias ColorSpecQuad integer

--- Specifies 32-bit color.
--- @alias ColorSpec
---| { a: integer, r: integer, g: integer, b: integer }
---| ColorSpecQuad
---| ColorString
