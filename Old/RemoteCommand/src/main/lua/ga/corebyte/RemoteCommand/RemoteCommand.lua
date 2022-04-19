local RemoteCommand = Class

function RemoteCommand:initialize()
    self.Commands = {}
end

function RemoteCommand:AddCommand(Name, Function)
    self.Commands[Name] = {Run = Function}
end

function RemoteCommand:Handle(Data, Connection)
    if self.Commands[Data.Name] then
        Logger:Debug("Running command " .. Data.Name)
        coroutine.wrap(self.Commands[Data.Name].Run)(Data.Parameters, Connection)
    else
        Logger:Warn("Remote tried to fire a not existsing command.")
    end
end

function RemoteCommand:HandleRaw(Message, Connection)
    
end

function RemoteCommand:Send(Name, Params)
    return Json.encode({Name = Name, Parameters = Params})
end

return RemoteCommand
