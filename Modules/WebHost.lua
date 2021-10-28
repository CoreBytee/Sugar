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
                Response.body = "OwO"
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
                path = "/API/Test",
            },
            function (Request, Response, go)
                Response.body = tostring(#Connections)
                Response.code = 200

                for Index, Connection in pairs(Connections) do
                    Connection.Write({payload = CommandHandler.RunCommand("PlayMedia", {Link = "https://www.myinstants.com/media/sounds/vine-boom.mp3"})})
                end
            end
        )

    end
}