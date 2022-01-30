return function ()

    --ejo its a echo command
    RemoteCommand:Register("echo", function (Parameters, Connection)
        Logger:Info("Ejo gotta echo this")
        p(Parameters)
        Logger:Info("")
    end)
end