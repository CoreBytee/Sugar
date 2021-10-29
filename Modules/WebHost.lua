return {
    IsClient = false,
    IsServer = true,

    Module = function()

        App.route(
            {
                method = "GET",
                path = "/",
            },
            function (Request, Response, go)
                Response.body = '<p>OwO</p> <meta http-equiv="refresh" content="3; URL=/index.html" />'
                Response.code = 200
            end
        )

        local Static = require('weblit-static')
        App.use(Static("./Static/"))

        App.route(
            {
                method = "GET",
                path = "/API/Connections",
            },
            function (Request, Response, go)
                Response.body = tostring(#Connections)
                Response.code = 200
            end
        )

        App.route(
            {
                method = "GET",
                path = "/API/Media",
            },
            function (Request, Response, go)
                Response.body = '<p>OwO</p> <meta http-equiv="refresh" content="0; URL=/index.html" />'
                Response.code = 200

                for Index, Connection in pairs(Connections) do
                    Connection.Write({payload = CommandHandler.RunCommand("PlayMedia", {Link = Request.query.Link})})
                end
            end
        )

        App.route(
            {
                method = "GET",
                path = "/API/Brightness",
            },
            function (Request, Response, go)
                Response.body = '<p>OwO</p> <meta http-equiv="refresh" content="0; URL=/index.html" />'
                Response.code = 200

                for Index, Connection in pairs(Connections) do
                    Connection.Write({payload = CommandHandler.RunCommand("Brightness", {Amount = tonumber(Request.query.A)})})
                end
            end
        )

        App.route(
            {
                method = "GET",
                path = "/API/Volume",
            },
            function (Request, Response, go)
                Response.body = '<p>OwO</p> <meta http-equiv="refresh" content="0; URL=/index.html" />'
                Response.code = 200

                for Index, Connection in pairs(Connections) do
                    Connection.Write({payload = CommandHandler.RunCommand("Volume", {Amount = tonumber(Request.query.A)})})
                end
            end
        )

    end
}