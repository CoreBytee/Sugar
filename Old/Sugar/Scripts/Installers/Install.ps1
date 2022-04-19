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

Write-Output "Tag is $Tag"
Write-Output "Downloading Sugar"
Invoke-WebRequest -O Installer.zip "https://github.com/CoreBytee/Sugar/archive/refs/tags/$Tag.zip" -UseBasicParsing

Write-Output "Unpacking"
Expand-Archive -LiteralPath ./Installer.Zip -DestinationPath ./

Write-Host "Removing ZIP"
Remove-Item Installer.zip

Write-Host "Renaming"
Move-Item "Sugar-$Tag/" Sugar

Set-Location Sugar

Write-Output "Making folders"
mkdir .\Binary
mkdir ./Binary/Luvit
mkdir ./Binary/FFTools

mkdir Deps

Write-Output "Downloading ffplay"
Invoke-WebRequest -O ./Binary/FFTools/ffplay.exe "https://github.com/CoreBytee/Sugar/releases/download/0.0.1/ffplay.exe" -UseBasicParsing
Write-Output "Downloading luvit"
Invoke-WebRequest -O ./Binary/Luvit/luvit.exe "https://github.com/CoreBytee/Sugar/releases/download/0.0.1/luvit.exe" -UseBasicParsing
Write-Output "Downloading lit"
Invoke-WebRequest -O ./Binary/Luvit/lit.exe "https://github.com/CoreBytee/Sugar/releases/download/0.0.1/lit.exe" -UseBasicParsing


Write-Output "Installing luvit packages"
./Binary/Luvit/lit install


Write-Output "Finishing"
$Value = ""
$Value += '{"Tag-Version": "'
$Value += $Tag
$Value += '", "_comment": "DONT CHANGE THIS!!!"}'
Set-Content -Path ./Config/VersionData.json -Value $Value

Set-Content -Path ./Config/DevMode.lua -Value "return false"

./StartClient.ps1