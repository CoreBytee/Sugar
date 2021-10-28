_G.VirusName = require("./Config/VirusName.lua")
_G.Logger = require("Logger")

local RuntimeArgs = args
RuntimeArgs[0] = nil
table.remove(RuntimeArgs, 1)

local Worked, Error = pcall(function()

    _G.FS = require("fs")
    _G.Webstocket = require("coro-websocket")
    _G.WebLit = require("weblit")
    _G.App = WebLit.app
    _G.Json = require("json")
    _G.WifiHelper = require("WifiHelper")
    _G.CommandHandler = require("CommandHandler")

    _G.User = _G.process.env.NAME or _G.process.env.USERNAME
    _G.OS = require("GetOS")()
    _G.RunType = require("./Config/RunType.lua")
    _G.DevMode = require("./Config/DevMode.lua")

    ControlConfig = require("./Config/Control.lua")

    if DevMode == true then
        _G.Control = ControlConfig.Dev
    else
        _G.Control = ControlConfig.Run
    end

    if RuntimeArgs[1] == "true" then
        Logger.Warn("Server override activating")
        _G.RunType = false
    end
    

    if RunType == true then
        _G.RunTypeString = "Client"
    else
        _G.RunTypeString = "Server"
    end


    Logger.Info(VirusName .. " started")

    require("./Main.lua")()

end)

if not Worked then
    Logger.Error(VirusName .. " failed with " .. Error)
else
    Logger.Info(VirusName .. " shut down successfully!")
end