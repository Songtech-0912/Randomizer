# Randomizer

<!--Badges here-->

A random number generator app that uses the [pywebview](https://https://pywebview.flowrl.com/) library. Read below for more details.

![App Screenshot](./images/Randomizer-Demo.png)

## What is this?

If you're a python developer, you've likely sniggered at the "poor" JavaScript developers. Not only are they forced to use a botchy language and an annoying package manager - they even have to bundle a whole web browser(!) to make a desktop app :(

Of course, I'm talking about ElectronJS. Yes, it's (literally) coarse, rough, irritating, and gets everywhere; but you've got to admit that those sleek electron apps look cool and modern. No Python framework truly comes close to power of HTML, CSS and JS. 

Pywebview is the best of both worlds. It's fast, runs natively, and works cross-platform; but it fits in perfectly to the HTML/CSS/JS family. You can write you app in Python, design its interface in web technologies, and package it as a <40MB binary.

As an example of what you can do with pywebview, I've made this app. It demonstrates many of pywebview's features, such as page transitions, interdomain communication, and passing variables between Python and JavaScript. And yeah - it's also a pretty good random number generator.

# Try it out

Download the AppImage, Mac App or Windows App from [here](https://github.com/Songtech-0912/Randomizer/releases).

Alternatively you can run from source, following the instructions below.

# Running from source

If you are running from source, be sure to be familiar with the terminal. If not, I suggest you consult [this page](https://www.howtogeek.com/140679/beginner-geek-how-to-start-using-the-linux-terminal/) or [this page](https://www.tutorialspoint.com/powershell/powershell_quick_guide.htm).

## Prerequisites

Before you can run from source, make sure you have dependencies installed:

### MacOS/Linux

You need Python 3+ (ideally version 3.3+) installed. To check if you have python installed, run this command:

```
[[ "$(python -V)" =~ "Python 3" ]] && echo "Python 3+ is installed"
```

On some Linux distributions and if you're on MacOS, the `python` command is replaced by a command called `python3`. If that's the case, and the first command fails, run this instead:

```
[[ "$(python3 -V)" =~ "Python 3" ]] && echo "Python 3+ is installed"
```

You will also need to have `pip` installed (on some Linux distributions, `pip` is called `pip3`). Check if you have it like this:

```
[[ "$(pip -V)" =~ "pip 20" ]] && echo "Pip 20+ is installed"
```

Alternatively, if this command fails, run the alternative form of the command:

```
[[ "$(pip3 -V)" =~ "pip 20" ]] && echo "Pip 20+ is installed"
```

Then, install pywebview:

```
pip install pywebview
```

If that does not work, then try running this instead:

```
pip3 install pywebview
```

Now, clone this repository:

```
git clone https://github.com/Songtech-0912/Randomizer.git && cd Randomizer
```

Make Randomizer executable:

```
chmod a+x Randomizer.py
```

And finally, run Randomizer:

```
./Randomizer.py
```

Ran into an issue? See [FAQ](FAQ.md) to find a solution to your problem.

### Windows

You need Python 3+ (ideally version 3.3+) installed. To check if you have python installed:

```
python --version
```

If the python version is at 2.x.x or the command fails, download python at <https://python.org>.

It is also required that you have `git` installed. Just go to <https://git-scm.com/download/win>, and run the installer to install it.

To begin, clone this repository:

```
git clone https://github.com/Songtech-0912/Randomizer.git && cd Randomizer
```

Install `pywebview` as a dependency:

```
pip install pywebview
```

And finally, run Randomizer:

```
python Randomizer.py
```

## Compiling Executables

> You don't *have* to compile executables to try Randomizer out! Instead, download a pre-built version [here](https://github.com/Songtech-0912/Randomizer/releases). If you want to modify the source code, you can just run the python file. Unless if you're a developer wishing to distribute a modified form of Randomizer, I wouldn't recommend compiling Randomizer.

First, you *must* make sure that you are using a vanilla distribution of python, instead of something like anaconda or miniconda. To check (on Mac and Linux):

```
which python
# should show something like: /usr/bin/python
```

To check (on Windows):

```
where python
# should show something like:
# C:\Users\yourusername\AppData\Local\Programs\Python\Python36
```

If this isn't the case, temporarily deactivate Anaconda/Miniconda so that it doesn't override vanilla python. On Mac and Linux, run this command:

```
echo "alias python=/usr/bin/python" >> .zshrc && source ~/.zshrc
```

Unfortunately, Windows users will have to configure Anaconda/Miniconda manually to do this.

Make sure that you've cloned the repository:

```
git clone https://github.com/Songtech-0912/Randomizer.git && cd Randomizer
```

Now, you can begin compiling, though the process will be different depending on whether you're on Mac/Linux or Windows

### Compiling on Mac/Linux

The Randomizer folder contains build scripts that should be able to build Randomizer automatically. These are managed by a `Makefile` at the root of the project.

To compile, first install `pyinstaller` with `pip` or `pip3`:

```
# If your system uses pip
pip install pyinstaller

# If your system uses pip3 instead of pip
pip3 install pyinstaller
```

It is recommended, but not required, to have `upx` installed (it optimizes the size of the binary):

```
# Debian
sudo apt install upx

# Arch
sudo pacman -S upx

# Fedora
sudo rpm insall upx

# Mac (homebrew)
brew install upx
```

If you are building on Linux, it is also a good idea to delete extra GTK resources to keep executable size low.

*Note that this will cause major display issues on a live machine, so please don't do this unless you are running a virtual machine or headless machine.*

```
cd /usr/share/icons && sudo rm -rf !("default")
cd /usr/share/themes && sudo rm -rf !("Default")
```

Then, run the Makefile:

```
make && make build
```

If you want to build a Linux AppImage, then instead of the command listed above, run:

```
make && make build && make appimage 
```

If you want to build a Mac app, then run this command instead of the other two:

```
make && make macapp
```

### Compiling on Windows

TODO - Not yet completed!
