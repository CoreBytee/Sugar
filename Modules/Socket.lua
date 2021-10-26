return function()

    print("socket loaded")

    -- Establish a new WSS connection to wss://echo.websocket.org:443
    -- Which is an echo server, meaning, whatever you send will
    -- get a response with the same contents you originally sent.
    local Response, Read, Write = Webstocket.connect({
        host = "ws.achex.ca",
        port = 443,
        tls = true
    })
    
    -- Did the connection get established successfully? if not what's the error?
    if not Response then
        print("Error establishing connection!\n" .. Read); return
    end
    
    -- Send a message opcode 2 with the payload of "Hello There!"
    Write({
        payload = "Hello There! Succ"
    })
    
    -- Execute the code inside the for loop each time we receive a message and then wait for more
    for Message in Read do
        -- Print the payload we got, since it is an echo server should be same as our request
        print("Host responded with " .. Message.payload)
        -- Listen to more stuff ...
        Response.socket:shutdown() -- Stop listening and close the connection
    end
    print("Connection closed!")

end