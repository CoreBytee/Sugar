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

    SocketServer:On(
        "Connection",
        function (Socket)
            Wait(1)
            p(Socket:Send("Echo", "Hello World"))
        end
    )

    SocketServer:WaitFor("Connection")

    Sugar.SocketServer = SocketServer
end