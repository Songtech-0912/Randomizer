"""
Randomizer
~~~~~~~~~~~~~~~~~

A demo app that utilizes the pywebview framework for its UI.
Think of it like an ElectronJS app, just faster and more native.
Hack it, fork it, do whatever you want with it!
"""

# Copyright Yuxuan Song, 2021
# This program is FREE AND OPEN-SOURCE SOFTWARE
# You are free to redistribute it
# provided that you abide by the terms of the GNU GPL License
# See LICENSE for additional details

# Note that the conda package manager breaks this application
# If you are using anaconda or miniconda,
# be sure to uncomment the lines in your ~/.bashrc or ~/.zshrc
# to reset your python $PATH to /usr/bin/python
# REMEMBER: vanilla Python only! No miniconda/anaconda!

# Everything here is commented to a crazy level
# The comments serve effectively as documentation
# That's why the comments are so verbose

import random
import webview

# So what is going on here?
# In essense I pass data from JS to Python and vice versa
# So that I can interact with the webview UI
# Because webview.start() is a blocking function
# we need to execute our python functions in a separate thread
# and call the function as an argument on start()
# We also define every function early on so that it's easier to
# call on them from our python logic thread


def loaded():
    """This function will be called when pywebview loads"""
    print("Application is running.")


def ended():
    """This function will be called when pywebview closes"""
    print("Application is closed.")


# output = ""

# Main function that generates random numbers
def generate_numbers(num1, num2):
    """Uses the random library to generate a random number.
    Accepts two arguments as min/max ranges"""
    randnum = random.randint(int(num1), int(num2))
    output = str(randnum)
    # callJavaScript()  # pass result (a number) to js
    return output


def main(window):
    """This creates a window with"""
    # expose the main python function generate_numbers() to js
    window.expose(generate_numbers)
    print("Starting graphical interface...")
    # calls the loaded() function once pywebview sends out a "loaded" event
    webview.windows[0].loaded += loaded
    print("Server log:")
    print("---------------------")
    # stops the loaded() function once pywebview sends out a "closed" event
    webview.windows[0].closed += ended


if __name__ == "__main__":
    # Tell webview to create a window with custom attributes.
    # Width and height can be adjusted as per personal preference
    window = webview.create_window(
        "Randomizer",
        "index.html",
        width=1200,
        height=900
    )
    # change debug to False
    # if you are optimizing this application
    # e.g. for packaging
    webview.start(main, window, http_server=True, debug=True)

# If the script doesn't launch
# you can set web engine to QtWebkit
# by uncommenting this line below:

# webview.start(gui="qt")
# webview.start(gui="gtk")
