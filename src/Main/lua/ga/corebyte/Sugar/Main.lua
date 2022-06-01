_G.Sugar = {
    Config = Import("ga.corebyte.Sugar.Registry.ConfigRegistry")(Import("ga.corebyte.Sugar.Helpers.Config"):new(TypeWriter.Here .. "/Sugar.properties")):Parse()
}