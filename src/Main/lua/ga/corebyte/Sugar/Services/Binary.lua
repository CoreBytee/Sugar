local Files = {
    {
        Name = "ffmpeg",
        Url = "https://github.com/CoreBytee/Sugar/releases/download/2.0.0-binary/ffmpeg",
        OS = {
            ["darwin"] = true
        }
    },
    {
        Name = "ffplay",
        Url = "https://github.com/CoreBytee/Sugar/releases/download/2.0.0-binary/ffplay",
        OS = {
            ["darwin"] = true
        }
    },

    {
        Name = "ffmpeg.exe",
        Url = "https://github.com/CoreBytee/Sugar/releases/download/2.0.0-binary/ffmpeg.exe",
        OS = {
            ["win32"] = true
        }
    },
    {
        Name = "ffplay.exe",
        Url = "https://github.com/CoreBytee/Sugar/releases/download/2.0.0-binary/ffplay.exe",
        OS = {
            ["win32"] = true
        }
    },
}

return function ()
    local Binary = Import("ga.corebyte.Sugar.Libraries.BinaryManager"):new(Files)
    Binary:Download()
end