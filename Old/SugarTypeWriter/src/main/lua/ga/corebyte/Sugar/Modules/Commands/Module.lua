return {
    Name = "Commands",
    Environment = {
        Client = Import("ga.corebyte.Sugar.Modules.Commands.Client"),
        Server = Import("ga.corebyte.Sugar.Modules.Commands.Server")
    }
}