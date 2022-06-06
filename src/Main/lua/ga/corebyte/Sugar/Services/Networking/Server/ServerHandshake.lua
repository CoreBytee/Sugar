return function ()
    Sugar.SocketServer:AddHandler(
        "Identify",
        function (HandshakeData, Return, Socket)
            Socket.Envoirment = HandshakeData.Envoirment
            Return(true)
            Sugar.SocketServer:Emit("Handshaked", Socket)
        end
    )
end