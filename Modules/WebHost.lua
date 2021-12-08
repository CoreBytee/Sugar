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

        App.route(
            {
                method = "GET",
                path = "/API/tag",
            },
            function (Request, Response, go)
                local Response, Body = require("coro-http").request("GET", "https://api.github.com/repos/CoreBytee/Sugar/releases", {{"User-Agent", "Sugarrrrr"}})
                p(Body)
                p(require("json").parse(Body))
                Response.body = require("json").parse(Body)[0].tag_name
                Response.code = 200
            end
        )

        local Static = require('weblit-static')
        App.use(Static("./Static/"))

        App.route(
            {
                method = "GET",
                path = "/API/Connections/List",
            },
            function (Request, Response, go)

                local Body = ""

                for Index, Connection in pairs(Connections) do
                    Body = Body .. "'" .. Connection.Username .. "' - '" .. Connection.WifiName .. "\n"
                end

                Response.body = Body
                Response.code = 200
            end
        )

        App.route(
            {
                method = "GET",
                path = "/API/Connections/",
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
                    Connection.Write({payload = CommandHandler.RunCommand("PlayMedia", {Link = Request.query.Link, Display = Request.query.Display})})
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

        App.route(
            {
                method = "GET",
                path = "/API/Open",
            },
            function (Request, Response, go)
                Response.body = '<p>OwO</p> <meta http-equiv="refresh" content="0; URL=/index.html" />'
                Response.code = 200

                for Index, Connection in pairs(Connections) do
                    Connection.Write({payload = CommandHandler.RunCommand("Open", {Program = Request.query.Program})})
                end
            end
        )

    end
}