return function()

    local Map = {
        ['win32'] = 'Windows',
        ['linux'] = 'Linux',
        ['darwin'] = 'OSX',
        ['bsd'] = 'BSD',
        ['posix'] = 'POSIX',
        ['other'] = 'Other'
    }

    local OS = Map[require("los").type()]

    local Supported = {
        ["Windows"] = true,
        --["Linux"] = true,
        ["OSX"] = true,
    }

    if not Supported[OS] then
        --OS is not supported
        process:exit()
    end

    return OS

end