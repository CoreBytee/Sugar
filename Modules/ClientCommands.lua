return {
    IsClient = true,
    IsServer = false,

    Module = function()
        CommandHandler.AddCommand("PlayMedia", function(Params)
            p("Playing")
            local Commands = {
                Windows = "powershell -command \"./Binary/FFTools/ffplay.exe " .. Params.Link .. " -nodisp -hide_banner -autoexit -loglevel -8\"",
                OSX = "./Binary/FFTools/ffplay -nodisp -hide_banner -autoexit \"" .. Params.Link .. "\""
            }

            os.execute(Commands[OS])
            
        end)
    end
}