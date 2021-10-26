

for i, v in pairs(FS.readdirSync("./Modules/")) do
    coroutine.wrap(function()
        require("./Modules/" .. v)()
    end)()
end