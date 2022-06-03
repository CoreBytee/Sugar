local Websocket = Import("ga.corebyte.BetterEmitter"):extend()

local CoroWebsocket = require("coro-websocket")
local Json = require("json")

function Websocket:initialize(Url)
    Import("ga.corebyte.Sugar.Libraries.Networking.MessageDecoder")(self)
    self.Host = {
        Url = Url,
        Options = CoroWebsocket.parseUrl(Url)
    }
    self.Events = {}
end

function Websocket:Connect()
    TypeWriter.Logger.Info("Connecting")
    local Response, Read, Write = CoroWebsocket.connect(self.Host.Options)

    if not Response then
        TypeWriter.Logger.Error(Read)
        return nil
    end

    TypeWriter.Logger.Info("Connected to %s", self.Host.Url)
    self.Connection = {
        Response = Response,
        Read = Read,
        Write = Write
    }
    coroutine.wrap(function ()
        for Message in Read do
            local Payload = Message.payload or ""
            if #Payload > 0 then
                self:Emit("RawMessage", Payload)
            end
        end
        self.Connection = nil
        TypeWriter.Logger.Info("Disconnected")
    end)()
end

function Websocket:Send(Name, ...)
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
end

function Websocket:AddHandler(Name, Func)
    self.Events[Name] = Func
end

return Websocket