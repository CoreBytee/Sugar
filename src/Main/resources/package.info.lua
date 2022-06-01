-- See https://github.com/Dot-lua/TypeWriter/wiki/package.info.lua-format for more info

return { InfoVersion = 1, -- Dont touch this

    ID = "Sugar", -- A unique id 
    Name = "Sugar",
    Description = "Sugar",
    Version = "1.0.0",

    Author = {
        Developers = {
            "CoreByte"
        },
        Contributors = {}
    },

    Dependencies = {
        Luvit = {
            "creationix/coro-http",
            "creationix/coro-websocket",
            "luvit/secure-socket",
            "creationix/weblit"
        },
        Git = {},
        Dua = {}
    },

    Contact = {
        Website = "https://sugar.corebyte.ga",
        Source = "https://github.com/CoreBytee/Sugar",
        Socials = {}
    },

    Entrypoints = {
        Main = "ga.corebyte.Sugar.Main"
    }

}
