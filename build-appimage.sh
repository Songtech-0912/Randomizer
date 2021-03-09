echo -e "Generating AppImage..."
# We copy the generate binary from dist/
cp ./dist/Randomizer ./release/appimage-build/Randomizer-Linux_64.AppDir/usr/bin/
# Then download appimagetool for generating appimages
# Here we fallback to curl if wget is not available
mkdir cache
mkdir /release/appimage-build/Randomizer-Linux_64.AppDir/usr
mkdir /release/appimage-build/Randomizer-Linux_64.AppDir/usr/bin
if command -v "$pip3" > /dev/null; then
    # Use curl to download
    curl -O "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" ./cache
fi
wget "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" ./cache
# Now we run appimagetool
chmod a+x ./cache/appimagetool-x86_64.AppImage
./cache/appimagetool-x86_64.AppImage ./release/appimage-build/Randomizer-Linux_64.AppDir
echo -e "AppImage successfully built at ./release/appimage-build!"
