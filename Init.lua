
local Worked, Error = pcall(function()

    _G.Logger = require("Logger")
    _G.FS = require("fs")
    _G.Webstocket = require("coro-websocket")
    _G.VirusName = require("./Configuration/VirusName.lua")

    Logger.Info(VirusName .. " started")

    require("./Main.lua")

end)

if not Worked then
    Logger.Error(VirusName .. " failed with " .. Error)
else
    Logger.Info(VirusName .. " shut down successfully!")
end