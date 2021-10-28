return {
    IsClient = true,
    IsServer = false,

    Module = function()

        print("socket loaded")
        p(Control.SocketHost)
    
        local Response, Read, Write = Webstocket.connect({
            host = Control.SocketHost,
            pathname = Control.SocketPath,
            port = Control.SocketPort,
            timeout = 10000
        })
        
        p(a)
        if not Response then
            print("Error establishing connection! (" .. Read .. ")"); return
        end
        p("b")

        Write({payload = CommandHandler.RunCommand("Test", nil)})

        p("sent")
    
        for Message in Read do
            print("Host responded with " .. Message.payload)
            CommandHandler.HandleRawData(Message)
            
        end
        print("Connection closed!")
    
    end
}


