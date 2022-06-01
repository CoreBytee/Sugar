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
        Func = Import("ga.corebyte.Sugar.Services.Networking.Client")
    },
    {
        Name = "NetworkServer",
        Type = "SugarBowl",
        Priority = 101,
        Func = Import("ga.corebyte.Sugar.Services.Networking.Server")
    }
}

return function (ServiceManager)
    for Index, Service in pairs(Services) do
        ServiceManager:Register(Service)
    end
    return ServiceManager
end