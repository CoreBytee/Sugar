local SocketServer = Import("ga.corebyte.BetterEmitter"):extend()

local Socket = Import("ga.corebyte.Sugar.Libraries.Networking.Socket")

function SocketServer:initialize()
    self.Connections = {}
end

function SocketServer:NewConnection(Connection)
    p(Connection)
    local NewSocket = Socket:new(Connection)
end

return SocketServer