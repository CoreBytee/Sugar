local ServiceHelper = Object:extend()

function ServiceHelper:initialize()
    self.Services = {}
end

function ServiceHelper:SetType(Type)
    self.Type = Type
end

function ServiceHelper:Register(Func, Type, Priority)
    table.insert(
        self.Services,
        {
            Func = Func,
            Type = Type,
            Priority = Priority
        }
    )
end

local function StartService(Service)
    coroutine.wrap(function ()
        Service.Func()
    end)()
end

function ServiceHelper:StartServices()
    for Index, Service in pairs(self.Services) do
        if Service.Type == true then
            StartService(Service)
        end
        if Service.Type == self.Type then
            StartService(Service)
        end
    end
end

return WorkHelper