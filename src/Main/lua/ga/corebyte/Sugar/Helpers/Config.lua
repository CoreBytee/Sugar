local Config = Object:extend()
local FS = require("fs")
local Json = require("json")

function Config:initialize(Path)
    self.Options = {}
    self.Path = Path
    self.Order = {}
end

function Config:Read()
    local ParsedData = {}
    local RawData = FS.readFileSync(self.Path)
    local Lines = RawData:split("\n")
    for Index, Line in pairs(Lines) do
        local SplitLine = Line:split("=")
        local Key = SplitLine[1]
        local Value = table.concat(SplitLine, "=", 2)
        p(SplitLine)
        p(Key)
        p(Value)

        local Num = tonumber(Value)
        if Num then
            Value = Num
        elseif Value == "true" then
            Value = true
        elseif Value == "false" then
            Value = false
        end
        ParsedData[Key] = Value
    end
    return ParsedData
end

function Config:Write(ConfigData)
    local Data = ""
    for Index, Key in pairs(self.Order) do
        if type(Key) == "table" then
            if Key.IsEmpty then
                Data = Data .. "\n"
            end
        else
            Data = Data .. Key .. "=" .. tostring(ConfigData[Key]) .. "\n"
        end
    end
    FS.writeFileSync(self.Path, Data)
end

function Config:Parse()
    if not FS.existsSync(self.Path) then
        FS.writeFileSync(self.Path, "")
    end

    local ConfigData = self:Read()
    local WriteBack = false
    for Key, Value in pairs(ConfigData) do
        if not self.Options[Key] then
            ConfigData[Key] = nil
            WriteBack = true
        end
    end
    for Key, Option in pairs(self.Options) do
        if not ConfigData[Key] then
            ConfigData[Key] = Option.Default
            WriteBack = true
        end
    end
    if WriteBack then
        self:Write(ConfigData)
    end
    return self
end

function Config:AddOption(Key, Default)
    table.insert(self.Order, Key)
    self.Options[Key] = {
        Key = Key,
        Default = Default
    }
    return self
end

function Config:AddLine()
    table.insert(self.Order, { IsEmpty = true })
    return self
end

function Config:GetOption(Key)
    if self.Data == nil then
        self:Parse()
    end
    return self.Data[Key]
end

return Config