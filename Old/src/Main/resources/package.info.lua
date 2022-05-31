-- See https://github.com/Dot-lua/TypeWriter/wiki/package.info.lua-format for more info

return { InfoVersion = 1, -- Dont touch this

    ID = "Sugar", -- A unique id 
    Name = "Sugar",
    Description = "SUGAAAAR",
    Version = "1.0.0",

    Author = {
        Developers = {
            "--------"
        },
        Contributors = {}
    },

    Dependencies = {
        Luvit = {
            -- HTTP libraries
            "creationix/coro-http",
            "creationix/coro-websocket",
            "creationix/weblit",
            "luvit/secure-socket",
        },
        Git = {},
        Dua = {}
    },

    Contact = {
        Website = "",
        Source = "",
        Socials = {}
    },

    Entrypoints = {
        Main = "Sugar"
    }

}
