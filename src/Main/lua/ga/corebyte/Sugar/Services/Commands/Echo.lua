return function ()
    Sugar.Websocket:AddHandler(
        "Echo",
        function (Payload, Return)
            Return(unpack(Payload))
        end
    )
end