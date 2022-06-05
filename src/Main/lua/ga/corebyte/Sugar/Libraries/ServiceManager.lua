local ServiceHelper = Object:extend()

function ServiceHelper:initialize()
    self.Services = {}
    self.Services.Client = {}
    self.Services.Server = {}
end

function ServiceHelper:SetType(Type)
    self.Type = Type
    return self
end

function ServiceHelper:RegisterClientService(ServiceRunner, Sync)
    if Sync == nil then
        Sync = false
    end
    table.insert(
        self.Services.Client, {
            ServiceRunner = ServiceRunner,
            Sync = Sync
        }
    )
end

function ServiceHelper:RegisterServerService(ServiceRunner, Sync)
    if Sync == nil then
        Sync = false
    end
    table.insert(
        self.Services.Server, {
            ServiceRunner = ServiceRunner,
            Sync = Sync
        }
    )
end

local function StartService(Service)
    if Service.Sync == true then
        Service.ServiceRunner()
    else
        coroutine.wrap(Service.ServiceRunner)()
    end
end

function ServiceHelper:StartServices()
    local Type
    if self.Type == "Sugar" then
        Type = "Client"
    elseif self.Type == "SugarBowl" then
        Type = "Server"
    end
    for Index, Service in pairs(self.Services[Type]) do
        StartService(Service)
    end
end

return ServiceHelper