local Package = {}

function Package.OnInitialize()

    local FS = require("fs")
    

    if not FS.existsSync("./Config.json") then
        FS.writeFileSync(
            "./Config.json",
            Json.encode(
                {
                    Type = "Client",
                    Debug = false
                },
                {
                    indent = true
                }
            )
        )
        Import("nl.cubic-inc.logger.Main"):new({}):Error("Please edit Config.json")
        process.exit(1)
    end

    _G.Config = Json.decode(FS.readFileSync("./Config.json"))
    _G.Logger = Import("nl.cubic-inc.logger.Main"):new({Debug = Config.Debug})


end

return Package
