if [ -d "./Sugar" ]
then
    echo "Removing old version in 3 seconds."
    sleep 1
    rm -rf "./Sugar"
    sleep 1
fi

tag=$(curl -L https://raw.githubusercontent.com/CoreBytee/Sugar/main/Scripts/Installers/Helpers/GetLatest.sh | sh)

echo "Tag is $tag"

curl -o Installer.zip -L "https://github.com/CoreBytee/Sugar/archive/refs/tags/$tag.zip"

unzip Installer -d ./

rm ./Installer.zip

mv "Sugar-$tag" "Sugar"

mkdir ./Sugar/Deps/
mkdir ./Sugar/Binary/
mkdir ./Sugar/Binary/Luvit/
mkdir ./Sugar/Binary/FFTools/

curl -o Binary.zip -L "https://github.com/CoreBytee/Sugar/releases/download/0.0.1/Binary.zip"
unzip Binary -d ./Binary

mv ./Binary/luvit ./Sugar/Binary/Luvit/
mv ./Binary/lit ./Sugar/Binary/Luvit/
mv ./Binary/ffplay ./Sugar/Binary/FFTools/
mv ./Binary/brightness ./Sugar/Binary/

rm -rf ./Binary/
rm ./Binary.zip

cd Sugar

./Binary/Luvit/lit install

echo "return false" > "./Config/DevMode.lua"
echo "return '$tag'" > "./Config/Version.lua"

./Binary/Luvit/luvit ./Init.lua