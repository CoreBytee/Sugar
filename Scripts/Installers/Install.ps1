$ProgressPreference = 'SilentlyContinue'

$Folder = './Sugar'
if (Test-Path -Path $Folder) {
    Write-Host "Removing old in 3 seconds" -ForegroundColor Red
    Start-Sleep 3
    Remove-Item $Folder -Recurse
}
else {
    Write-Output "Downloading"
}


$Tag = [Net.ServicePointManager]::SecurityProtocol = 'Tls12'; Invoke-Expression ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/CoreBytee/Sugar/main/Scripts/Installers/Helpers/GetLatest.ps1'))

Invoke-WebRequest -O Installer.zip "https://github.com/CoreBytee/Sugar/archive/refs/tags/$Tag.zip" -UseBasicParsing

Expand-Archive -LiteralPath ./Installer.Zip -DestinationPath ./

Write-Host "Removing ZIP"
Remove-Item Installer.zip

Write-Host "Renaming"
Move-Item "Sugar-$Tag/" Sugar

Set-Location Sugar

mkdir .\Binary
mkdir ./Binary/Luvit
mkdir ./Binary/FFTools

mkdir Deps


Invoke-WebRequest -O ./Binary/FFTools/ffplay.exe "https://github.com/CoreBytee/Sugar/releases/download/0.0.1/ffplay.exe" -UseBasicParsing


Set-Location .\Binary/Luvit


PowerShell -NoProfile -ExecutionPolicy unrestricted -Command "[Net.ServicePointManager]::SecurityProtocol = 'Tls12'; iex ((new-object net.webclient).DownloadString('https://github.com/luvit/lit/raw/master/get-lit.ps1'))"

Set-Location ..
Set-Location ..

./Binary/Luvit/lit install



$Value = ""
$Value += '{"Tag-Version": "'
$Value += $Tag
$Value += '", "_comment": "DONT CHANGE THIS!!!"}'
Set-Content -Path ./Config/VersionData.json -Value $Value

Set-Content -Path ./Config/DevMode.lua -Value "return false"

./StartClient.ps1