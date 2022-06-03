return function ()
    local Websocket = Import("ga.corebyte.Sugar.Libraries.Networking.Websocket"):new("ws://localhost:6126/socket")

    Websocket:Connect()
    Sugar.Websocket = Websocket
end