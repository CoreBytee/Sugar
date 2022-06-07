return function ()
    local Binary = Import("ga.corebyte.Sugar.Libraries.BinaryManager"):new(Import("ga.corebyte.Sugar.Registry.BinaryRegistry"))
    Binary:Download()
end