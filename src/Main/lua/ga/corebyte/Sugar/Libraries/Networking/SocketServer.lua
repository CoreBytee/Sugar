local SocketServer = Import("ga.corebyte.BetterEmitter"):extend()

local Socket = Import("ga.corebyte.Sugar.Libraries.Networking.Socket")

function SocketServer:initialize()
    self.Connections = {}
    self.Events = {}
end

function SocketServer:GetConnections()
    return self.Connections
end

function SocketServer:NewConnection(Connection)
    local NewSocket = Socket:new(Connection)
    NewSocket.Events = self.Events
    local SocketId = #self.Connections + 1
    NewSocket.Id = SocketId
    self.Connections[SocketId] = NewSocket
    TypeWriter.Logger.Info("Client %s connected", SocketId)
    NewSocket:On(
        "Disconnect",
        function ()
            self.Connections[SocketId] = nil
            TypeWriter.Logger.Info("Client %s disconnected", SocketId)
        end
    )
    self:Emit("Connection", NewSocket)
end

function SocketServer:AddHandler(Name, Func)
    self.Events[Name] = Func
end

function SocketServer:SendToAll(Name, ...)
    for _, Connection in pairs(self.Connections) do
        coroutine.wrap(
            function ()
                Connection:Send(Name, ...)
            end
        )()
    end
end
    
end

return SocketServer