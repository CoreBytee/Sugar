local Config = Object:extend()
local FS = require("fs")
local Json = require("json")

function Config:initialize(Path)
    self.Options = {}
    self.Path = Path
end

function Config:Read()
    if not FS.existsSync(Path) then
        FS.writeFileSync(Path, "[]")
    end

    local WriteBack = false
    local WriteOrder = {}
    local ConfigData = Json.decode(FS.readFileSync(Path))
    for Key, Option in pairs(self.Options) do
        table.insert(WriteOrder, Key)
        if ConfigData[Key] == nil then
            ConfigData[Key] = Option.Default
            WriteBack = true
        else
            if Option.Types[type(Option)] ~= true then
                ConfigData[Key] = Option.Default
                WriteBack = true
            end
        end
    end
    for Key, Option in pairs(ConfigData) do
        if self.Options[Key] == nil then
            ConfigData[Key] = nil
            WriteBack = true
        end
    end
    self.Data = ConfigData
    if WriteBack == true then
        FS.writeFileSync(
            self.Path,
            Json.encode(
                ConfigData,
                {
                    indent = true,
                    keyorder = WriteOrder
                }
            )
        )
    end
end

function Config:AddOption(Key, Default, Types)
    local ParsedTypes = {}
    for Index, Value in pairs(Types) do
        ParsedTypes[Value] = true
    end
    self.Options[Key] = {
        Key = Key,
        Default = Default,
        Types = ParsedTypes
    }
end

function Config:GetOption(Key)
    if self.Data == nil then
        self:Read()
    end
    return self.Data[Key]
end

return Config