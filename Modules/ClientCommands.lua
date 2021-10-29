return {
    IsClient = true,
    IsServer = false,

    Module = function()
        CommandHandler.AddCommand("PlayMedia", function(Params)
            local Commands = {
                Windows = "powershell -command \"./Binary/FFTools/ffplay.exe " .. Params.Link .. " -nodisp -hide_banner -autoexit -loglevel -8\"",
                OSX = "./Binary/FFTools/ffplay " .. Params.Link .. " -nodisp -hide_banner -autoexit -loglevel -8\""
            }
    
            local Handle = io.popen(Commands[OS], "r")

            Handle:close()
        end)
    end
}