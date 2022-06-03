local Json = require("json")

return function (Obj)
    Obj:On(
        "RawMessage",
        function (Data)
            Obj:Emit(
                "DecodedMessage",
                Json.decode(Data)
            )
        end
    )

    Obj:On(
        "DecodedMessage",
        function (Data)
            if Data.Type == "Message" then
                Obj:Emit(
                    "Message",
                    Data.Name,
                    Data.Sequence,
                    Data.Payload
                )
            elseif Data.Type == "Response" then
                Obj:Emit(
                    "Response",
                    Data.Sequence,
                    Data.Payload
                )
            end
        end
    )

    Obj:On(
        "Message",
        function (Name, Sequence, Payload)
            if Obj.Events == nil then return end
            if Obj.Events[Name] == nil then
                TypeWriter.Logger.Error("No event handler for %s", Name)
                return
            end

            local Returned = false
            local function Return(...)
                Obj.Connection.Write(
                    {
                        payload = Json.encode(
                            {
                                Type = "Response",
                                Sequence = Sequence,
                                Payload = {...}
                            }
                        )
                    }
                )
                Returned = true
            end
            Obj.Events[Name](
                Payload,
                Return
            )
            if Returned == false then
                Return(nil)
            end
        end
    )
end