return function (App)
    App.route(
        {
            method = "GET",
            path = "/API/Connections/List/",
        },
        function (Request, Response)
            local Return = {}

            for Index, Connection in pairs(Connections) do
                table.insert(Return, {Id = Connection.Id})
            end
            Response.body = Json.encode(Return)
            Response.code = 200
        end
    )
end