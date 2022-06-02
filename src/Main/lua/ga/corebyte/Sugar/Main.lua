-- Load libraries
TypeWriter.Runtime.LoadInternal("BetterEmitter")
-- Libraries
local Config = Import("ga.corebyte.Sugar.Libraries.Config")
local ServiceManager = Import("ga.corebyte.Sugar.Libraries.ServiceManager")
-- Registry
local ConfigRegistry = Import("ga.corebyte.Sugar.Registry.ConfigRegistry")
local ServiceRegistry = Import("ga.corebyte.Sugar.Registry.ServiceRegistry")

_G.Sugar = {}
Sugar.Config = ConfigRegistry(Config:new(TypeWriter.Here .. "/Sugar.properties")):Parse()
local ConfigType = Sugar.Config:GetOption("Type")
if ConfigType ~= "Sugar" or ConfigType ~= "SugarBowl" then
    Sugar.Config:SetOption("Type", "Sugar")
    ConfigType = "Sugar"
end
if TypeWriter.ArgumentParser:GetArgument("client", "client", "false") == "true" then
    TypeWriter.Logger.Info("Activating client override")
    ConfigType = "Sugar"
end
if TypeWriter.ArgumentParser:GetArgument("server", "server", "false") == "true" then
    TypeWriter.Logger.Info("Activating server override")
    ConfigType = "SugarBowl"
end
Sugar.Type = ConfigType
Sugar.ServiceManager = ServiceRegistry(ServiceManager:new():SetType(ConfigType)):StartServices()