---
title: "Bash"
linkTitle: "Bash"
description: >
  Small introduction to Bash
categories:
- Programming
tags:
- Tools
- Bash
---

-   [Bash](https://linuxconfig.org/bash-scripting-tutorial) it the
    command language used in terminal.

Bash is a shell and is pre-installed. A *bash* script contains *commands* in
plain text. In order to create a bash script please decide for a
convenient name. Let us assume we name our script *myscript*. Than you can
create and edit such a script with

    $ touch myscript.sh
    $ emacs myscripts.sh

Next you need to add the following line to the top ogf the script:

    !# /bin/bash

To demonstrate how to continue writing a script we will be using the
bash `echo` command that allows you to print text. Lets make the second
line

    echo "Hello World"

You can now save and start executing your script. Click "File" and then
"Save". Open Terminal and type in `cd` followed by the name of the
folder you put the document in. Now we need to execute the script.

*Executing* a Bash script is rather easy. In order to execute a script,
we need to first execute the *permission set*. In order to give Terminal
permission to read/execute a Bash script, you have to type

    chmod u+x myscript.sh

After the script has been granted permission to be executed, you can
test it by typing

    ./myscript.sh

into the terminal. You will see it prints

    Hello World

## OSX terminal:

On macOS, when you navigate to the search magnification glass, you can
type in *terminal* to start it. A terminal allows you to execute a
number of commands to interact with the computer from a commandline
interface, e.g. the terminal.

MOst recently the terminal has in macOS switched from bash to
zsh. Please: consult with zsh tutorials. However the Linux commands
you use in zsh are the same.
