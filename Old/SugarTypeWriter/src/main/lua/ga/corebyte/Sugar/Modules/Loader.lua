return function ()
    local Modules = Import("ga.corebyte.Sugar.Modules.Modules")
    for Index, Module in pairs(Modules) do
        if Module.Environment.Client ~= nil and IsClient == true then
            coroutine.wrap(Module.Environment.Client)()
        end
        if Module.Environment.Server ~= nil and IsServer == true then
            coroutine.wrap(Module.Environment.Server)()
        end
    end
end