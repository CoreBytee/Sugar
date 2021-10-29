_G.Commands = {}

local Library = {}

Library.AddCommand = function(Name, CommandFunction)
    Commands[Name] = {Run = CommandFunction}
end

Library.HandleCommand = function(Data, Connection)
    coroutine.wrap(Commands[Data.Name].Run)(Data.Params, Connection)
end

Library.HandleRawData = function(Message, Write)

    local Connection

    for i, v in pairs(Connections) do
        if v.Write == Write then
            Connection = v
        end
    end

    Library.HandleCommand(Json.parse(Message.payload), Connection)
end

Library.RunCommand = function(Name, Params)
    return Json.encode({Name = Name, Params = Params})
end

return Library