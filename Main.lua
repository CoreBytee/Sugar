return function()
    Logger.Info(" ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ")
    Logger.Info("████████████████████████████████")
    Logger.Info("█ ▄▄▄▄█▄ ██ ▄█ ▄▄▄▄██▀▄ ██▄ ▄▄▀█")
    Logger.Info("█▄▄▄▄ ██ ██ ██ ██▄ ██ ▀ ███ ▄ ▄█")
    Logger.Info("█▄▄▄▄▄██▄▄▄▄██▄▄▄▄▄█▄▄█▄▄█▄▄█▄▄█")
    Logger.Info("████████████████████████████████")
    Logger.Info(string.format("█████▀▀▀ %s Edition ▀▀▀█████", RunTypeString))
    Logger.Info("█████ MADE BY : [REDACTED] █████")
    Logger.Info("▀██████████████████████████████▀")





    for i, v in pairs(FS.readdirSync("./Modules/")) do
        
        local Module = require("./Modules/" .. v)

        if RunType == true then
            if Module.IsClient == true then
                coroutine.wrap(Module.Module)()
            end
        else
            if Module.IsServer == true then
                coroutine.wrap(Module.Module)()
            end
        end

    end
end