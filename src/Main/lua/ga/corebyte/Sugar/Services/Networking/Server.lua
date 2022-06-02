return function ()
    local WebServer = Import("ga.corebyte.Sugar.Libraries.Networking.WebServer"):new()
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
end