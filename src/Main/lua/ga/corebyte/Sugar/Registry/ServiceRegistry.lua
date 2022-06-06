--#region Services
local Services = {
    Client = {
        Banner = Import("ga.corebyte.Sugar.Services.Banner"),
        Binary = Import("ga.corebyte.Sugar.Services.Binary"),
        NetworkClient = Import("ga.corebyte.Sugar.Services.Networking.Client.Client"),
        ClientHandshake = Import("ga.corebyte.Sugar.Services.Networking.Client.ClientHandshake"),
        EchoCommand = Import("ga.corebyte.Sugar.Services.Commands.Echo")
    },
    Server = {
        Banner = Import("ga.corebyte.Sugar.Services.Banner"),
        NetworkServer = Import("ga.corebyte.Sugar.Services.Networking.Server.Server"),
        ServerHandshake = Import("ga.corebyte.Sugar.Services.Networking.Server.ServerHandshake"),
        API = {
            Connections = Import("ga.corebyte.Sugar.Services.Networking.Server.API.Connections")
        }
    }
}
--#endregion
return function (ServiceManager)
--#region Register Client Services
    ServiceManager:RegisterClientService(Services.Client.Banner)
    ServiceManager:RegisterClientService(Services.Client.Binary, true)
    ServiceManager:RegisterClientService(Services.Client.NetworkClient, true)
    ServiceManager:RegisterClientService(Services.Client.ClientHandshake)
    ServiceManager:RegisterClientService(Services.Client.EchoCommand)
--#endregion
--#region Register Server Services
    ServiceManager:RegisterServerService(Services.Server.Banner)
    ServiceManager:RegisterServerService(Services.Server.NetworkServer, true)
    ServiceManager:RegisterServerService(Services.Server.ServerHandshake)

    --API
    ServiceManager:RegisterServerService(Services.Server.API.Connections)
--#endregion
    return ServiceManager
end