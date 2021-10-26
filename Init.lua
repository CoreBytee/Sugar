_G.VirusName = require("./Config/VirusName.lua")

local Worked, Error = pcall(function()

    _G.Logger = require("Logger")
    _G.FS = require("fs")
    _G.Webstocket = require("coro-websocket")
    _G.WebLit = require("weblit")
    _G.Control = require("./Config/Control.lua")
    _G.RunType = require("./Config/RunType.lua")

    if RunType == true then
        _G.RunTypeString = "Client"
    else
        _G.RunTypeString = "Server"
    end



    Logger.Info(VirusName .. " started")

    require("./Main.lua")

end)

if not Worked then
    Logger.Error(VirusName .. " failed with " .. Error)
else
    Logger.Info(VirusName .. " shut down successfully!")
end