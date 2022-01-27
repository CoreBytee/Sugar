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
    
    App.websocket(
        {
            path = "/", -- Prefix for matching
        },
        function (Request, Read, Write)
            -- Log the request headers
            p(req)
            -- Log and echo all messages
            for message in read do
                write(message)
            end
            -- End the stream
            write()
        end
    )
    
    App.start()
end