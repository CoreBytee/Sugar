local ServiceHelper = Object:extend()

function ServiceHelper:initialize()
    self.Services = {}
end

function ServiceHelper:SetType(Type)
    self.Type = Type
    return self
end

function ServiceHelper:Register(Service)
    self.Services[Service.Priority] = Service
    return self
end

local function StartService(Service)
    if Service.Sync == true then
        Service.Func()
    else
        coroutine.wrap(Service.Func)()
    end
end

function ServiceHelper:StartServices()
    local Priorities = {}
    for Index, Service in pairs(self.Services) do
        table.insert(Priorities, Service.Priority)
    end
    table.sort(Priorities)
    for Index, Priority in pairs(Priorities) do
        local Service = self.Services[Priority]
        if Service.Type == true then
            StartService(Service)
        end
        if Service.Type == self.Type then
            StartService(Service)
        end
    end
end

return ServiceHelper