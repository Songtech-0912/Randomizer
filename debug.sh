echo -e "Starting build..."

pip install pyinstaller
pip install pywebview

# Debug pyinstaller build

pyinstaller --add-data "index.html:x" --add-data "output.style.css:." --onedir Randomizer.py
du -h -d 3 ./dist/Randomizer

echo -e "Build finished. Executable in ./dist/Randomizer"
