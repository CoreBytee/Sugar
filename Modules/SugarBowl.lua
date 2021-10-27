return {
    IsClient = false,
    IsServer = true,

    Module = function()
        local App = WebLit.app
    
        App.bind({
            host = Control.SocketHost,
            port = Control.SocketPort
        })

        App.use(WebLit.logger)

        local Connections = {}

        App.websocket(
            {
                path = Control.SocketPath, -- Prefix for matching
            },
            function (Request, Read, Write)

                table.insert(Connections, {Write = Write, Read = Read, Request = Request})

                Logger.Info("A new user connected, " .. #Connections .. " users connected.")
                while true do
                    local Message = Read()

                    if not Message then break end

                    CommandHandler.HandleRawData(Message)
                    --Write({payload = Json.encode({YourMessage = Message.payload})})
                end
                -- End the stream
                Write()

                for i, v in pairs(Connections) do
                    if v.Write == Write then
                        table.remove(Connections, i)
                        Logger.Info("A user disconnected, " .. #Connections .. " users connected.") 
                    end
                end
            end
        )

        coroutine.wrap(function()
            while true do
                require("timer").sleep(5000)
                for i, v in pairs(Connections) do
                    v.Write({payload = CommandHandler.RunCommand("Test", {"tests"})})
                end
            end
        end)()

        App.start()
    end
}