local FS = require("fs")

if not FS.existsSync("./Config.json") then
    FS.writeFileSync(
        "./Config.json",
        Json.encode(
            {
                Type = "Client",
                Debug = false,
                WebServer = {
                    Host = "0.0.0.0",
                    Port = 8080,
                    PathName = "/control/"
                },
                WebClient = {
                    Host = "localhost",
                    Port = 8080,
                    TLS = true,
                    PathName = "/control/"
                }
            },
            {
                indent = true
            }
        )
    )
    Import("nl.cubic-inc.logger.Main"):new({}):Error("Please edit Config.json")
    process:exit(1)
end


_G.Config = Json.decode(FS.readFileSync("./Config.json"))
_G.Logger = Import("nl.cubic-inc.logger.Main"):new(
    {
        Debug = Config.Debug,
        Out = function (self, Text)
            print(Text)
        end
    }
)

_G.IsClient = Config.Type == "Client" and not (args[2] == "Server" or args[3] == "Server")
_G.IsServer = Config.Type == "Server" or args[2] == "Server" or args[3] == "Server"

if IsClient then
    _G.RunningType = "Client"
elseif IsServer then
    _G.RunningType = "Server"
end

Logger:Info(" ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ ")
Logger:Info("████████████████████████████████")
Logger:Info("█ ▄▄▄▄█▄ ██ ▄█ ▄▄▄▄██▀▄ ██▄ ▄▄▀█")
Logger:Info("█▄▄▄▄ ██ ██ ██ ██▄ ██ ▀ ███ ▄ ▄█")
Logger:Info("█▄▄▄▄▄██▄▄▄▄██▄▄▄▄▄█▄▄█▄▄█▄▄█▄▄█")
Logger:Info("████████████████████████████████")
Logger:Info(string.format("█████▀▀▀ %s Edition ▀▀▀█████", RunningType))
Logger:Info("█████ MADE BY : [REDACTED] █████")
Logger:Info("▀██████████████████████████████▀")
Logger:Info("")

_G.RemoteCommand = Import("ga.corebyte.RemoteCommand.Main"):new()

if IsClient then
    Import("ga.corebyte.Sugar.Boot.Client")
end

if IsServer then
    Import("ga.corebyte.Sugar.Boot.Server")
end

Import("ga.corebyte.Sugar.Modules.Loader")()