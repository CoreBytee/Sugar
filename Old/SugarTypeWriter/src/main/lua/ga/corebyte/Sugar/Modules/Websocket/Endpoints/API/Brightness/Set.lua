return function (App)
    App.route(
        {
            method = "GET",
            path = "/API/Brightness/Set/",
        },
        function (Request, Response)
            if not Request then return end
            if not Request.query then return end
            if not Request.query.Amount then return end
            local Amount = tonumber(Request.query.Amount)
            if not Amount then return end

            for Index, Connection in pairs(Connections) do
                Connection.Write(
                    {
                        payload = RemoteCommand:Send("brightness", {Amount = math.clamp(Amount, 0, 100) / 100})
                    }
                )
            end

            Response.body = Json.encode(true)
            Response.code = 200
        end
    )
end