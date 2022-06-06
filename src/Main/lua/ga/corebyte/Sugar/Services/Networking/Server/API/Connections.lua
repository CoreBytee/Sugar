local Json = require("json")

return function ()
    Sugar.WebServer:Route(
        {
            method = "GET",
            path = "/API/Connections"
        },
        function (Request, Response)
            local Sockets = Sugar.SocketServer:GetConnections()
            local Connections = {}
            for Index, Socket in pairs(Sockets) do
                table.insert(
                    Connections,
                    {
                        Id = Socket.Id,
                        Envoirment = Socket.Envoirment
                    }
                )
            end
            Response.body = Json.encode(
                Connections,
                {
                    indent = true
                }
            )
            Response.code = 200
        end
    )
end