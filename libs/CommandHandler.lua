_G.Commands = {}

local Library = {}

Library.AddCommand = function(Name, CommandFunction)
    Commands[Name] = {Run = CommandFunction}
end

Library.HandleCommand = function(Data)
    coroutine.wrap(Commands[Data.Name].Run)(Data.Params)
end

Library.HandleRawData = function(Message)
    Library.HandleCommand(Json.parse(Message.payload))
end

Library.RunCommand = function(Name, Params)
    return Json.encode({Name = Name, Params = Params})
end

return Library