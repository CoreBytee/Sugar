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
            path = Config.WebClient.PathName,
        },
        function (Request, Read, Write)
            Write({payload = "Hello"})
            Write()
        end
    )
    
    App.start()
end