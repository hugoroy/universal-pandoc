-- french.lua v0.1
--
--    Copyright (c) 2021 Edgar Vincent
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.
--
-- Description:
--
-- This Lua filter for Pandoc replaces regular spaces with the appropriate
-- type of non-breaking space in French language files.
--
-- TODO:
-- - Make language metadata detection more robust
-- - Add missing punctuation rules (?)
-- - Benckmark thoroughly and improve performance
-- - Improve error-handling
-- - Check if the default execution order of filter functions does
-- actually need to be changed.

-- Modules
local utils = require 'pandoc.utils'
local stringify = utils.stringify

-- Constants
local SCRIPT_NAME = "french.lua"

-- Custom functions
--
-- Returns the value of `list` whose key is `x`,
-- or else returns `false`.
function is_key (list, x)
  for k, _ in pairs(list) do
    if k == x then return k end
  end
  return false
end

-- Build `pandoc` strings from UTF-8 characters
local nbsp = pandoc.Str("\u{0000A0}")
local thinsp = pandoc.Str("\u{002009}")

-- Table containing rules regarding French spaces which are adjacent to punctuation marks.
-- For non-breaking spaces, see http://bdl.oqlf.gouv.qc.ca/bdl/gabarit_bdl.asp?id=2039
-- for a reference.
local punct = {
-- punctuation mark, position of non-breaking space, type of non-breaking space
  [':'] = {pos = -1, char = nbsp},
  ['»'] = {pos = -1, char = nbsp},
  ['»)'] = {pos = -1, char = nbsp},
  [';'] = {pos = -1, char = thinsp},
  ['!'] = {pos = -1, char = thinsp},
  ['?'] = {pos = -1, char = thinsp},
  ['«'] = {pos = 1, char = nbsp},
  ['(«'] = {pos = 1, char = nbsp}
}

-- Whether or not to format the file
local rep_space = false

-- Language detection
function Meta(meta)
  -- By default, don't format the file
  local lang = false
  if meta.lang then
    lang = stringify(meta.lang)
  elseif meta.language then
    lang = stringify(meta.language)
  end
  if lang and lang:find("^fr") then
    rep_space = true
  else
    io.stderr:write(string.format(SCRIPT_NAME, ": WARN: No language metadata set or language is not French. Not doing anything.\n"))
  end
end

function Inlines (inlines)
  if rep_space then
    for i = 1, #inlines do
      local text = inlines[i].text
      -- If the current `Inline` element is defined in `punct`, then
      -- check whether there is a regular space before or after it.
      if i > 1 and is_key (punct, text) then
        local position = i + punct[text].pos
        if inlines[position].t == "Space" then
          -- If so, replace it with the appropriate non-breaking space.
          inlines[position] = punct[text].char
        end
      end
    end
    return inlines
  end
end

  -- The `Meta` filter should be run before the
  -- `Inlines` filter because we need to know whether
  -- the filter is relevant to the input file's language.
  return {
    { Meta = Meta },
    { Inlines = Inlines }
  }
