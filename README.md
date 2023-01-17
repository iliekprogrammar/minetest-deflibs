Currently this library definition is updated according to Minetest API during
snapshot `89e7f72c9`, within development of 5.7.0.

This library definition

# Documentation
Documentation here will be different from the official `lua_api.txt` as it
sources not only from this file but also from the engine source code, both lua
and C++. Not only that, this sources from the official [minetest
docs](https://github.com/minetest/minetest_docs/) project.

## Status: not ready to accept contributions
Currently, the files most completed, but are not final:
* `library/minetest/chat.lua`
* `library/invref.lua`
* `library/types.lua`

# To-Dos
* [ ] Document every symbol officially documented in `lua_api.txt`
  * [ ] Ensure function signatures are documented correctly.
  * [ ] Ensure types and classes are documented correctly.
  * [ ] Ensure integer ranges are documented correctly.
  * [ ] Ensure symbol implementation is referenced
  * [ ] Ensure callback chains are documented correctly.
  * [ ] Ensure reference to `lua_api.txt` section is correct. Consider referencing `lua_api.txt` next to `@implementation`.
* [ ] Slim down some documentation. e.g. `Formspec` and `GroupRating`
* [ ] Update to 5.7.0. `git diff` is your friend. (`magit-diff-range` is your bestie)

# Structure
WIP. Could change

* [ ] Combine `library/types` and `library/minetest/SECTION.t.lua` together. Put
      auxiliary types in their own subsection in the same file.

## `library/minetest.lua`
Currently undocumented functions under `minetest` namespace. This list is
generated from dumping the global table.

## `library/CLASS.lua`
Defines API for the `CLASS` objects.
Auxiliary types may be defined here.

## `library/minetest/SECTION.lua`
Defines API under the `minetest` namespace about `SECTION`.

## `library/minetest/SECTION.t.lua`
Defines auxiliary types for its main file, `library/minetest/SECTION.lua`.

## `library/types/SECTION.lua`
Defines definition tables and various types about `SECTION` as organized in `lua_api.txt`.
Auxiliary types may be merged here instead.

## `config.lua`
Library definition configuration for sumneko's lua language server. Completed
