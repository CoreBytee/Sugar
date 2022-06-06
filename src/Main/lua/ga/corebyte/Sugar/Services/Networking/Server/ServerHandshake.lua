return function ()
    Sugar.SocketServer:AddHandler(
        "Identify",
        function (HandshakeData, Return, Socket)
            Socket.Envoirment = HandshakeData[1].Envoirment
            Return(true)
            Sugar.SocketServer:Emit("Handshaked", Socket)
        end
    )
end