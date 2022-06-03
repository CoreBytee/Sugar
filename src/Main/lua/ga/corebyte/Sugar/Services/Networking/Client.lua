local UrlBuilder = Import("ga.corebyte.Sugar.Libraries.Networking.UrlBuilder")

return function ()
    local ConnectionUrl = UrlBuilder("ws", "socket")
    local PingUrl = UrlBuilder("http")

    local Websocket = Import("ga.corebyte.Sugar.Libraries.Networking.Websocket"):new("ws://localhost:6126/socket")
    Sugar.Websocket = Websocket

    coroutine.wrap(function ()
        while true do
            if Websocket:CanConnect(PingUrl) then
                Websocket:Connect()
                TypeWriter.Logger.Info("Reconnecting in 5 seconds...")
            else
                TypeWriter.Logger.Warn("Could not connect to %s", ConnectionUrl)
                TypeWriter.Logger.Info("Reconnecting in 5 seconds...")
            end
            Wait(5)
        end
    end)()
    Websocket:WaitFor("Connected")
end