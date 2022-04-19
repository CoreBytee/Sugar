return {
    Name = "Websocket",
    Environment = {
        Client = Import("ga.corebyte.Sugar.Modules.Websocket.Client"),
        Server = Import("ga.corebyte.Sugar.Modules.Websocket.Server")
    }
}