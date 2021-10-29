return {
    IsClient = true,
    IsServer = false,

    Module = function()
        CommandHandler.AddCommand("PlayMedia", function(Params)
            Logger.Info("Playing " .. Params.Link or "")
            local Commands = {
                Windows = "powershell -command \"./Binary/FFTools/ffplay.exe " .. Params.Link .. " -nodisp -hide_banner -autoexit -loglevel -8\"",
                OSX = "./Binary/FFTools/ffplay -nodisp -hide_banner -autoexit \"" .. Params.Link .. "\""
            }

            os.execute(Commands[OS])
            
        end)

        CommandHandler.AddCommand("Brightness", function(Params)
            Logger.Info("Setting brightness to " .. Params.Amount)
            local Commands = {
                Windows = "",
                OSX = "./Binary/brightness " .. Params.Amount / 10
            }

            os.execute(Commands[OS])
            
        end)

        CommandHandler.AddCommand("Volume", function(Params)
            Logger.Info("Setting volume to " .. Params.Amount)
            local Commands = {
                Windows = "",
                OSX = "osascript -e \"set Volume " .. Params.Amount .. "\""
            }

            os.execute(Commands[OS])
            
        end)

        CommandHandler.AddCommand("Open", function(Params)
            Logger.Info("Opening " .. Params.Program)
            local Commands = {
                Windows = "",
                OSX = "open " .. Params.Program
            }

            os.execute(Commands[OS])
            
        end)
    end
}