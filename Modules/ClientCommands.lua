return {
    IsClient = true,
    IsServer = false,

    Module = function()
        CommandHandler.AddCommand("PlayMedia", function(Params)
            local Commands = {
                Windows = "powershell -command \"./Binary/FFTools/ffplay.exe " .. Params.Link .. " -nodisp -hide_banner -autoexit -loglevel -8\"",
                OSX = ""
            }
    
            local Handle = io.popen(Commands[OS], "r")

            Handle:close()
        end)
    end
}