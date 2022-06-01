local ConfigHelper = Import("ga.corebyte.Sugar.Helpers.Config")
local ServiceHelper = Import("ga.corebyte.Sugar.Helpers.ServiceHelper")
local ConfigRegistry = Import("ga.corebyte.Sugar.Registry.ConfigRegistry")

_G.Sugar = {
    Config = ConfigRegistry(ConfigHelper:new(TypeWriter.Here .. "/Sugar.properties")):Parse(),
    ServiceManager = ServiceHelper:new()
}

