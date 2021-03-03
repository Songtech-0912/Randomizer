echo -e "Starting build..."
pip install pyinstaller
pip install pywebview
pip install --user PyGobject
pyinstaller --add-data 'index.html:.' --add-data 'output.style.css:.' --onefile Randomizer.py
echo -e "Build finished. Executable in ./dist/Randomizer"