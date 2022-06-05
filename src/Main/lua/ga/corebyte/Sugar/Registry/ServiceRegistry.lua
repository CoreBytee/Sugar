--#region Services
local Services = {
    Banner = Import("ga.corebyte.Sugar.Services.Banner"),
    NetworkClient = Import("ga.corebyte.Sugar.Services.Networking.Client"),
    ClientHandshake = Import("ga.corebyte.Sugar.Services.Networking.ClientHandshake"),
    NetworkServer = Import("ga.corebyte.Sugar.Services.Networking.Server"),
    EchoCommand = Import("ga.corebyte.Sugar.Services.Commands.Echo")
}
--#endregion
return function (ServiceManager)
--#region Register Client Services
    ServiceManager:RegisterClientService(Services.Banner)
    ServiceManager:RegisterClientService(Services.NetworkClient, true)
    ServiceManager:RegisterClientService(Services.ClientHandshake)
    ServiceManager:RegisterClientService(Services.EchoCommand)
--#endregion
--#region Register Server Services
    ServiceManager:RegisterServerService(Services.Banner)
    ServiceManager:RegisterServerService(Services.NetworkServer, true)

--#endregion
    return ServiceManager
end