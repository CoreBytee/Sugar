return function(Config)
    Config:AddOption("Debug", false, { "boolean" })
    Config:AddOption("DeveloperMode", false, { "boolean" })
    Config:AddOption("Type", "Sugar", { "boolean" })

    Config:AddLine()

    Config:AddOption("Sugar.Main.Host", "sugar.corebyte.ga")
    Config:AddOption("Sugar.Main.Port", 6126)

    Config:AddLine()


    Config:AddOption("Sugar.Test.Host", "localhost")
    Config:AddOption("Sugar.Test.Port", 6126)

    Config:AddLine()

    Config:AddOption("SugarBowl.Host", "0.0.0.0")
    Config:AddOption("SugarBowl.Port", 6126)

    Config:AddLine()

    Config:AddOption("Spoon.IsSpoon", false)
    Config:AddOption("Spoon.Key", "")

    return Config
end