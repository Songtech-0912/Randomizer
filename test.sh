# test.sh
# checks if NPX is installed
# if not, the script directs the user to installing npx

# OS check
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="GNU/Linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="MacOS"
elif [[ "$OSTYPE" == "cygwin"* ]]; then
    OS="Cygwin"
else
    echo Your system does not support NPX, which is required to build these docs
    exit
fi

echo -e "\033[1;34mWelcome, $OS user!\033[0m"

# NPX check

if command -v npx &> /dev/null
then
    echo -e "\033[32mI've detected that you have NPX installed! That's awesome! \033[0m"
    echo You\'re ready to begin hacking on this project!
    echo -e "Next step: run\033[1;32m npm install && npm run build \033[0m"
    echo
else
    echo -e "\033[32mI've detected that you don't have NPX installed!\033[0m"
    echo To build these docs from source you\'ll need NPX!
    echo
    echo Try doing one of these things to solve the problem:
    echo -e "1) Re-installing NPM"
    echo -e "2) Running\033[1;31m npm install -g npx \033[0m"
    echo
fi
