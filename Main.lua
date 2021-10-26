
Logger.Info(" ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ")
Logger.Info("█ ▄▄▄▄█▄ ██ ▄█ ▄▄▄▄██▀▄ ██▄ ▄▄▀█")
Logger.Info("█▄▄▄▄ ██ ██ ██ ██▄ ██ ▀ ███ ▄ ▄█")
Logger.Info("█▄▄▄▄▄██▄▄▄▄██▄▄▄▄▄█▄▄█▄▄█▄▄█▄▄█")
Logger.Info("████████████████████████████████")
Logger.Info(string.format("█████▀▀▀ %s Edition ▀▀▀█████", RunTypeString))
Logger.Info("█████ MADE BY : [REDACTED] █████")
Logger.Info("▀██████████████████████████████▀")





for i, v in pairs(FS.readdirSync("./Modules/")) do
    coroutine.wrap(function()
        require("./Modules/" .. v)()
    end)()
end