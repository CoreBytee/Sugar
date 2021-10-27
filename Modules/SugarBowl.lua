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

        App.websocket(
            {
                path = Control.SocketPath, -- Prefix for matching
            },
            function (Request, Read, Write)
                -- Log the request headers
                p(Request)
                -- Log and echo all messages
                for Message in Read do
                    Write(Message)
                end
                -- End the stream
                Write()
            end
        )

        App.start()
    end
}