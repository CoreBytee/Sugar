_G.Connection = {}

local Files = ResourceHelper.GetJson("sugar", "data/sugar/binary/" .. string.lower(RuntimeOS) .. "/Files.json")
local Request = require("coro-http").request
local Sha1 = require("sha1")

function DownloadFile(File)
    Logger:Info("Downloading " .. File.Name)
    local Success, Reponse, Body = pcall(Request, "GET", File.Url)

    if not Success then
        Logger:Warn("Error while downloading file " .. File.Name)
        Logger:Warn(Reponse)
        Logger:Warn("Retrying in 10 seconds")
        Wait(10)
        Logger:Warn("Retrying")
        return DownloadFile(File)
    end

    FS.writeFileSync("./Binary/" .. File.Name, Body)
    if File.chmod then
        os.execute("chmod +x ./Binary/" .. File.Name)
    end

    if File.Hash ~= nil then
        if File.Hash ~= Sha1(FS.readFileSync("./Binary/" .. File.Name)) then
            FS.unlinkSync("./Binary/" .. File.Name)
            Logger:Warn("Hashes do not match")
            Logger:Warn("Downloading again")
            return DownloadFile(File)
        else
            Logger:Info("Hashes match!")
        end
    end

    Logger:Info("Download complete!")
end

FS.mkdirSync("./Binary/")



for Index, File in pairs(Files) do
    local Exists = FS.existsSync("./Binary/" .. File.Name)
    if not Exists then
        DownloadFile(File)
    end
end

p(Import("ga.corebyte.Sugar.Helpers.Brightness").Set(0.5))