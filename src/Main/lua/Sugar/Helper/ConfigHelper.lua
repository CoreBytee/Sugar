local ConfigHelper = Object:extend()

local FileSystem = require("fs")
local Path = require("path")
local Json = require("json")

function ConfigHelper:initialize(ConfigPath)
    self.ConfigPath = ConfigPath
    self.Settings = {}
    self.Order = {}
end

function ConfigHelper:AddSetting(Key, Value)
    self.Settings[Key] = Value
    table.insert(self.Order, Key)
end

function ConfigHelper:ReadFile()
    if not FileSystem.existsSync(self.ConfigPath) then
        FileSystem.writeFileSync(self.ConfigPath, "{}")
    end
    return Json.decode(FileSystem.readFileSync(self.ConfigPath))
end

function ConfigHelper:ResetFile(ConfigData)
    return FileSystem.writeFileSync(
        self.ConfigPath,
        Json.encode(
            ConfigData,
            {
                indent = true,
                keyorder = self.Order,
            }
        )
    )
end

function ConfigHelper:ParseConfig()
    local ConfigData = self:ReadFile()

    local Reset = false
    for SettingsKey, SettingsValue in pairs(self.Settings) do
        if ConfigData[SettingsKey] == nil then
            ConfigData[SettingsKey] = SettingsValue
            Reset = true
        end
    end

    for Key, Value in pairs(ConfigData) do
        if self.Settings[Key] == nil then
            ConfigData[Key] = nil
            Reset = true
        end
    end
    
    if Reset then
        self:ResetFile(ConfigData)
        return false
    end
    return true
end

return ConfigHelper