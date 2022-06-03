local Socket = Import("ga.corebyte.BetterEmitter"):extend()

local Json = require("json")

function Socket:initialize(Connection)
    self.Connection = Connection

    Import("ga.corebyte.Sugar.Libraries.Networking.MessageDecoder")(self)
    coroutine.wrap(function ()
        for Message in Connection.Read do
            local Payload = Message.payload or ""
            if #Payload ~= 0 then
                self:Emit("RawMessage", Payload)
            end
        end
        self:Emit("Disconnect")
    end)()    
end

function Socket:Send(Name, ...)
    local Sequence = string.random(16)
    self.Connection.Write(
        {
            payload = Json.encode(
                {
                    Type = "Message",
                    Sequence = Sequence,
                    Name = Name,
                    Payload = {...}
                }
            )
        }
    )
    local Data = {self:WaitFor("Response", nil, function (IncomingSequence)
        return IncomingSequence == Sequence
    end)}
    return table.unpack(Data[3])
end

return Socket