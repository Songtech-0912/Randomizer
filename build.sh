echo -e "Starting build..."
# On some linux systems the pip3 command is used instead of pip
# Here we detect if pip3 is used and we switch all commands to pip3
if command -v "$pip3" > /dev/null; then
    alias pip="pip3"
fi

# Install neccesary dependencies
pip install pyinstaller
pip install pywebview

# Run pyinstaller
pyinstaller --add-data 'index.html:.' --add-data 'output.style.css:.' --exclude-module PyQt5 --exclude-module sympy --exclude-module numpy --onefile Randomizer.py
echo -e "Build finished. Executable in ./dist/Randomizer"
echo -e "You may wish to run \e[33mmake appimage\e[0m to build an AppImage from the binary."
