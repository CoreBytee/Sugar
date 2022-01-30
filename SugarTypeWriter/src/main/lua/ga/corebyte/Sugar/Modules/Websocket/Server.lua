return function ()
    local App = require("weblit").app

    App.bind(
        {
            host = Config.WebServer.Host,
            port = Config.WebServer.Port
        }
    )
    
    App.use(require('weblit-auto-headers'))
    
    App.route(
        {
            method = "GET",
            path = "/",
        },
        function (Request, Response)
            Response.body = "OwO"
            Response.code = 200
        end
    )

    App.route(
        {
            method = "GET",
            path = "/ping/",
        },
        function (Request, Response)
            Response.body = "Pong"
            Response.code = 200
        end
    )
    
    App.websocket(
        {
            path = Config.WebClient.PathName,
        },
        function (Request, Read, Write)

            local Connection = {
                Request = Request,
                Read = Read,
                Write = Write,

                Id = #Connections + 1
            }

            table.insert(Connections, Connection)
            Logger:Info("New connection with id " .. Connection.Id)
            Logger:Info("Now running " .. #Connections .. " connection(s)")

            for Message in Read do
                
                if #Message.payload ~= 0 then
                    RemoteCommand:Handle(Json.decode(Message.payload))
                end
            end

            Logger:Info("Disconnecting " .. Connection.Id)
            Logger:Info("Now running " .. #Connections - 1 .. " connection(s)")
            table.remove(Connections, Connection.Id)

            Write()
        end
    )
    
    App.start()
end