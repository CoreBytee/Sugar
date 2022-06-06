local Binary = Class:extend()

local FS = require("fs")
local Request = require("coro-http").request

function Binary:initialize(Files)
    self.Files = Files
end

local function DownloadFile(File)
    local Success, Response, Body = pcall(Request, "GET", File.Url)
    if Success == true and Response.code == 200 then
        FS.writeFileSync("./Binary/" .. File.Name, Body)
        TypeWriter.Logger.Info("Downloaded " .. File.Name)
    else
        TypeWriter.Logger.Error("Failed to download binary file: " .. File.Name)
        Wait(5)
        DownloadFile(File)
    end
end

function Binary:Download()
    FS.mkdirSync("./Binary/")
    for Index, File in pairs(self.Files) do
        if File.OS[TypeWriter.Os] and not FS.existsSync("./Binary/" .. File.Name) then
            DownloadFile(File)
        end
    end
end

return Binary