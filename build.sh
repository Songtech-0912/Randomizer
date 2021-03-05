echo -e "Starting build..."
pip install pyinstaller
pip install pywebview
pip install --user PyGobject
# pyinstaller --add-data 'index.html:.' --add-data 'output.style.css:.' --onefile Randomizer.py
pyinstaller --add-data 'index.html:.' --add-data 'output.style.css:.' --exclude-module PyQt5 --exclude-module sympy --exclude-module numpy Randomizer.py
echo -e "Build finished. Executable in ./dist/Randomizer"
