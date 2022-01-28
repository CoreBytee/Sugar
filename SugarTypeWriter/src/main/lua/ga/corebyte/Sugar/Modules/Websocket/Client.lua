return function ()
    Logger:Info("Connecting to websocket")

    _G.Connection = {}

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


    Logger:Info("Connected")

    while true do
        local Message = Read()
        if Message.opcode == 8 then break end
        RemoteCommand:Handle(Json.decode(Message.payload))
    end
end