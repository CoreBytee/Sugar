return {GetUser = function ()
    return _G.process.env.NAME or _G.process.env.USERNAME
end}