local Brightness = {}

local Spawn = require("coro-spawn")

function Brightness.Get()
    local Result, Error = Spawn(
        "./Binary/Brightness",
        {
            args = {
                "-l"
            }
        }
    )

    Result.waitExit()

    return math.floor(
        tonumber(
            Split(
                Split(
                    Result.stdout.read(),
                    "\n"
                )[2],
                " "
            )[4]
        ) * 100
    ) / 100
    
end

function Brightness.Set(Value)
    local Result = Spawn(
        "./Binary/brightness",
        {
            args = {
                Value
            }
        }
    )

    Result.waitExit()
    return true
end

return Brightness