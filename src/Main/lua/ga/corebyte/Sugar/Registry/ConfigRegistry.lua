return function(Config)
    Config:AddOption("Debug", false, { "boolean" })
    Config:AddOption("DeveloperMode", false, { "boolean" })
    Config:AddOption("Type", "Sugar", { "boolean" })

    Config:AddLine()

    Config:AddOption("Sugar.Main.Host", "sugar.corebyte.ga", { "string" })
    Config:AddOption("Sugar.Main.Port", 6126, { "number" })

    Config:AddLine()


    Config:AddOption("Sugar.Test.Host", "sugar.corebyte.ga", { "string" })
    Config:AddOption("Sugar.Test.Port", 6126, { "number" })

    Config:AddLine()

    Config:AddOption("SugarBowl.Host", "0.0.0.0", { "string" })
    Config:AddOption("SugarBowl.Port", 6126, { "number" })

    Config:AddLine()

    Config:AddOption("Spoon.IsSpoon", false, { "boolean" })
    Config:AddOption("Spoon.Key", "", { "string" })

    return Config
end