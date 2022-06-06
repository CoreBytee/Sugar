local Uv = require("uv")

return function ()
    local Archive = TypeWriter.LoadedPackages.Sugar
    local BuildInfo = Archive.BuildInfo
    local Package = Archive.Package

    Sugar.Websocket:On(
        "Connected",
        function ()
            local Response = Sugar.Websocket:Send(
                "Identify",
                {
                    BuildDate = BuildInfo.Date,
                    SugarVersion = Package.Version,
                    Envoirment = {
                        Username = Uv.os_get_passwd().username,
                        Host = Uv.os_gethostname(),
                        OS = TypeWriter.Os
                    }
                }
            )
            if Response == true then
                TypeWriter.Logger.Info("Handshake successful")
                Sugar.Websocket:Emit("Handshaked")
            end
        end
    )
end