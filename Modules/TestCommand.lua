return {
    IsClient = true,
    IsServer = true,

    Module = function()
        CommandHandler.AddCommand("Test", function(a)
            p("CommandCalled")
            p(a)
        end)
    end
}