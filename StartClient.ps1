Write-Output "return true" | Out-File ./Config/RunType.lua
Start-Sleep 1
./Binary/Luvit/luvit ./Init.lua