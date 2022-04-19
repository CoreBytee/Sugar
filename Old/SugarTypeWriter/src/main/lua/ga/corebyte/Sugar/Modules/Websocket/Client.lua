local function Connect()
    Logger:Info("Connecting to websocket")

    local Response, Read, Write = require("coro-websocket").connect(
        {
            host = Config.WebClient.Host,
            port = Config.WebClient.Port,
            pathname = Config.WebClient.PathName,
            tls = Config.WebClient.TLS or false,
            timeout = 2 * 1000,
            heartbeat = 30 * 1000
        }
    )


    Connection.Response = Response
    Connection.Read = Read
    Connection.Write = Write

    Write(
        {
            payload = RemoteCommand:Send(
                "handshake",
                {}
            )
        }
    )

    Logger:Info("Connected to websocket")

    while true do
        local Message = Read()
        if not Message then break end
        RemoteCommand:Handle(Json.decode(Message.payload))
    end

    Logger:Info("Disconnected from websocket")

end

local function CanConnect()
    Logger:Info("Trying to ping host")
    local Success, Response, Body = pcall(
        require("coro-http").request,
        "GET",
        "http://" .. Config.WebClient.Host .. ":" .. Config.WebClient.Port .. "/ping/"
    )

    if Success then
        if type(Response) == "table" then
            if Response.code == 200 then
                Logger:Info("Ping successful")
                return true
            else
                Logger:Error("Code is not 200: " .. tostring(Response.code))
                return false
            end
        else
            Logger:Error("Response is not table")
            return false
        end
    else
        Logger:Error("Could not ping host: " .. tostring(Split(Response, ": ")[3]))
        Logger:Debug("Full reason " .. Response)
        return false
    end

end

return function ()
    
    while true do
        if CanConnect() then
            Connect()
        end

        Logger:Info("Reconnecting in 10 seconds")

        Wait(10)
    end
end