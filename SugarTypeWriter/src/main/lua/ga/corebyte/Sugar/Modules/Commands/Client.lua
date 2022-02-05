return function ()
    local Brightness = Import("ga.corebyte.Sugar.Helpers.Brightness")
    RemoteCommand:Register("brightness", function (Parameters)
        Brightness.Set(Parameters.Amount)
    end)
end