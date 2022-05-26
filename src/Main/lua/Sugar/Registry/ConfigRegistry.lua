
local ConfigHelper = Import("Sugar.Helper.ConfigHelper"):new(TypeWriter.Here .. "/./SugarConfig.json")

ConfigHelper:AddSetting("http.main.domain", "localhost")
ConfigHelper:AddSetting("http.main.port", 6126)

ConfigHelper:AddSetting("http.test.domain", "localhost")
ConfigHelper:AddSetting("http.test.port", 6126)

ConfigHelper:AddSetting("devmode.enabled", false)

return ConfigHelper:ParseConfig()