local WebServer = Object:extend()

local SocketServer = Import("ga.corebyte.Sugar.Libraries.Networking.SocketServer")

function WebServer:initialize()
    local App = require("weblit").app
    require("weblit-websocket")

    App.bind(
        {
            host = "0.0.0.0",
            port = Sugar.Config:GetOption("SugarBowl.Port")
        }
    )
    
    App.use(require('weblit-logger'))
    App.use(require('weblit-auto-headers'))
    App.use(require("weblit-cors"))
    
    self.App = App
end

function WebServer:Start()
    self.App.start()
end

function WebServer:Route(Options, Function)
    self.App.route(
        Options,
        Function
    )
    return App
end

function WebServer:Socket(Options)
    local SocketServer = SocketServer:new()
    self.App.websocket(
        Options,
        function (Request, Read, Write)
            SocketServer:NewConnection(
                {
                    Request = Request,
                    Read = Read,
                    Write = Write
                }
            )
        end
    )
    return SocketServer
end

return WebServer