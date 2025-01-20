VERSION = "1.0.0"

local micro = import("micro")
local config = import("micro/config")
local buffer = import("micro/buffer")

function insertTimestamp(bp)
  if not bp or not bp.Cursor then
    micro.InfoBar():Error("Cursor not available")
    return
  end

  local timestamp = os.date("%Y-%m-%d %H:%M:%S")
  local loc = buffer.Loc(bp.Cursor.Loc.X, bp.Cursor.Loc.Y) -- Vytvoření nové hodnoty buffer.Loc
  bp.Buf:Insert(loc, timestamp)
end

function init()
  config.MakeCommand("insertTimestamp", insertTimestamp, config.NoComplete)
  config.TryBindKey("F5", "lua:stamp.insertTimestamp", false)
end
