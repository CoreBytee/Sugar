return {
    IsClient = false,
    IsServer = true,

    Module = function()
    
        App.bind({
            host = "0.0.0.0",
            port = Control.SocketPort
        })

        --App.use(WebLit.logger)

        _G.Connections = {}

        App.websocket(
            {
                path = Control.SocketPath,
            },
            function (Request, Read, Write)

                table.insert(Connections, {Write = Write, Read = Read, Request = Request})

                Logger.Info("A new user connected, " .. #Connections .. " users connected.")
                while true do
                    local Message = Read()

                    if not Message then break end

                    CommandHandler.HandleRawData(Message, Write)
                end
                Write()

                for i, v in pairs(Connections) do
                    if v.Write == Write then
                        table.remove(Connections, i)
                        Logger.Info("A user disconnected, " .. #Connections .. " users connected.") 
                    end
                end
            end
        )

        CommandHandler.AddCommand("SetInfo", function(Params, Connection)
            Connection.Username = Params.Username
            Connection.WifiName = Params.Wifi
        end)

        App.start()
    end
}