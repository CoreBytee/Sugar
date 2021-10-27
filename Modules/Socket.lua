return {
    IsClient = true,
    IsServer = false,

    Module = function()

        print("socket loaded")
    
        -- Establish a new WSS connection to wss://echo.websocket.org:443
        -- Which is an echo server, meaning, whatever you send will
        -- get a response with the same contents you originally sent.
        local Response, Read, Write = Webstocket.connect({
            host = Control.SocketHost,
            pathname = Control.SocketPath,
            port = Control.SocketPort,
        })
        
        -- Did the connection get established successfully? if not what's the error?
        if not Response then
            print("Error establishing connection! (" .. Read .. ")"); return
        end
        
        -- Send a message opcode 2 with the payload of "Hello There!"
        Write({
            payload = "Hello There!"
        })
        
        Write({
            payload = "How are ya"
        })

    
        for Message in Read do
            print("Host responded with " .. Message.payload)

            
        end
        print("Connection closed!")
    
    end
}


