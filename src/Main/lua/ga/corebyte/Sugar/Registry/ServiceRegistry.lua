local Services = {
    {
        Name = "Banner",
        Type = true,
        Priority = 1,
        Func = Import("ga.corebyte.Sugar.Services.Banner"),
        Sync = true
    },
    {
        Name = "NetworkClient",
        Type = "Sugar",
        Priority = 100,
        Func = Import("ga.corebyte.Sugar.Services.Networking.Client"),
        Sync = true
    },
    {
        Name = "NetworkServer",
        Type = "SugarBowl",
        Priority = 101,
        Func = Import("ga.corebyte.Sugar.Services.Networking.Server"),
        Sync = true
    },
    {
        Name = "EchoCommand",
        Type = "Sugar",
        Priority = 200,
        Func = Import("ga.corebyte.Sugar.Services.Commands.Echo"),
    }
}

return function (ServiceManager)
    for Index, Service in pairs(Services) do
        ServiceManager:Register(Service)
    end
    return ServiceManager
end