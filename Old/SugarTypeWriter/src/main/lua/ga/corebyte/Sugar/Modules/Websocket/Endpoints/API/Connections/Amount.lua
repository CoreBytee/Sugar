return function (App)
    App.route(
        {
            method = "GET",
            path = "/API/Connections/Amount/",
        },
        function (Request, Response)
            Response.body = Json.encode(#Connections)
            Response.code = 200
        end
    )
end