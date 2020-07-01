#! /bin/sh

function remove_folder_with_metafile() {
    rm -rf "$1"
    rm "$1.meta"
}

function remove_file_with_metafile() {
    rm "$1"
    rm "$1.meta"
}

# Zenject-usage를 빌드합니다.
msbuild /p:Configuration=Release AssemblyBuild/Zenject-usage/Zenject-usage.sln
pushd UnityProject/Assets/Plugins/Zenject/Source/Usage
rm UnityEngine.*
rm link.xml # upm을 사용하면 link.xml 작동하지 않습니다. 있으면 괜히 헷갈려서 제거합니다.
rm link.xml.meta
rm Zenject-usage.pdb
popd

# csproj와 sln를 삭제합니다.
find . -name "*.csproj" -type f -delete
find . -name "*.csproj.meta" -type f -delete
find . -name "*.sln" -type f -delete
find . -name "*.sln.meta" -type f -delete

# Zenject 폴더를 이동시킵니다.
mv UnityProject/Assets/Plugins/Zenject/* .
rm UnityProject/Assets/Plugins/Zenject.meta .

# 불필요한 폴더들을 삭제합니다.
rm *.md
rm -rf AssemblyBuild
rm -rf Build
rm -rf Documentation
rm -rf NonUnityBuild
rm -rf UnityProject

# Zenject 내의 불필요한 파일들을 삭제합니다.
pushd OptionalExtras
remove_folder_with_metafile IntegrationTests
remove_folder_with_metafile TestFramework
remove_folder_with_metafile UnitTests
remove_folder_with_metafile ReflectionBaking
remove_folder_with_metafile "SampleGame1 (Beginner)"
remove_folder_with_metafile "SampleGame2 (Advanced)"
remove_file_with_metafile AutoMocking.zip
remove_file_with_metafile AutoSubstitute.zip
popd
