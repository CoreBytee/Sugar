local RemoteCommand = Class

function RemoteCommand:initialize()
    self.Commands = {}
end

function RemoteCommand:AddCommand(Name, Function)
    self.Commands[Name] = {Run = Function}
end

function RemoteCommand:Handle(Data, Connection)
    coroutine.wrap(Commands[Data.Name].Run)(Data.Params, Connection)
end

function RemoteCommand:HandleRaw(Message, Connection)
    
end

function RemoteCommand:RunCommand()
    
end

return RemoteCommand