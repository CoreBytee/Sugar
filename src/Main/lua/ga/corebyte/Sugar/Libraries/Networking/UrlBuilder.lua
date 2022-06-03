

return function (Protocol, Path)
    local DeveloperMode = Sugar.Config:GetOption("DeveloperMode")
    local Type = "Main"
    if DeveloperMode == true then
        Type = "Test"
    end
    local Prefix = "Sugar." .. Type
    local Host = Sugar.Config:GetOption(Prefix .. ".Host")
    local Port = Sugar.Config:GetOption(Prefix .. ".Port")
    local Tls = Sugar.Config:GetOption(Prefix .. ".TLS")

    Path = Path or ""
    local FullProtocol = Protocol .. "://"
    if Tls == true then
        FullProtocol = Protocol .. "s://"
    end
    return FullProtocol .. Host .. ":" .. Port .. "/" .. Path
end