return {
    GetConnectedWifi = function()

        local Commands = {
            Windows = "Powershell.exe -Command \"(get-netconnectionProfile).Name\"",
            OSX = "/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}'"
        }

        local Handle = io.popen(Commands[OS], "r")
    
        local Name

        for Line in Handle:lines() do
            Name = Line
            --Logger.Info(Line)
        end
    
        Handle:close()

        return Name
    end
}