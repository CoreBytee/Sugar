return function ()
    local WebServer = Import("ga.corebyte.Sugar.Libraries.Networking.WebServer"):new()
    local SocketServer = WebServer:Socket({path = "/socket"})
    WebServer:Route(
        {
            method = "GET",
            path = "/"
        },
        function (Request, Response)
            Response.body = "Pong"
            Response.code = 200
        end
    )
    WebServer:Start()
    Sugar.SocketServer = SocketServer
    Sugar.WebServer = WebServer
end