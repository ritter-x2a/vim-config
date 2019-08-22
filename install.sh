#!/bin/bash

mkdir -p ~/.vimundo
mkdir -p ~/.vimswp

if [ $# == 0 ]; then
    echo "Setting up default config."
    ln -sf default_init.vim init.vim
    exit 0
elif [ $# == 1 ]; then
    if [ $1 == "default" ]; then
        echo "Setting up default config."
        ln -sf default_init.vim init.vim
        exit 0
    elif [ $1 == "minimal" ]; then
        echo "Setting up minimal config."
        ln -sf minimal_init.vim init.vim
        exit 0
    fi
fi
echo "Invalid invocation!"
echo "Usage:"
echo "  ./install.sh default"
echo "or"
echo "  ./install.sh minimal"
exit 1
