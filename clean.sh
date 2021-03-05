echo Clearing build artifacts...
rm -rf *.spec
rm -rf build
rm -rf cache
rm -rf __pycache__
while true; do
    read -p "Do you also want to delete generated executables? " yn
    case $yn in
        [Yy]* ) rm -rf dist; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo -e "Clearing done."
