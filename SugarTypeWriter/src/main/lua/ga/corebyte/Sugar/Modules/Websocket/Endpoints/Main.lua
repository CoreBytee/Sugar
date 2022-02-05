return function (App)
    App.route(
        {
            method = "GET",
            path = "/",
        },
        function (Request, Response)
            table.insert(Response.headers, {"Location", "http://youtube.com"})
            Response.body = "OwO"            
            Response.code = 301
        end
    )
end