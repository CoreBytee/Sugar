-- See https://github.com/Dot-lua/TypeWriter/wiki/package.info.lua-format for more info

return {InfoVersion = 1,

    ID = "sugar",
    Version = "2.0.0",

    Name = "Sugar",
    Description = "A virus with a licence",
    Licence = "MIT",

    Author = {
        Developers = {
            "CoreByte",
            "Captain_Yoinkers"
        },
        Contributors = {}
    },

    Dependencies = {
        Luvit = {
            "creationix/coro-http",
            "creationix/coro-websocket",
            "creationix/coro-spawn",

            "creationix/weblit"
        },
        Dua = {}
    },

    Contact = {
        Website = "",
        Source = "",
        Socials = {}
    },

    Entrypoints = {
        Main = "ga.corebyte.Sugar.Main",
        OnLoad = "ga.corebyte.Sugar.OnLoad",
        
        Client = "ga.corebyte.Sugar.Client",
        Server = "ga.corebyte.Sugar.Server"
    }

}
