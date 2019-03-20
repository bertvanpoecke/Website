#!/bin/bash
PYTHONENVIRONMENTFOLDER="penv"
NODEENVIRONMENTFOLDER="nenv"

if [ ! -d "$PYTHONENVIRONMENTFOLDER" ]; then
    echo "Checking if virtualenv is installed..."
    if ! which virtualenv > /dev/null; then
        echo "No virtualenv installed..."
        exit 1
    fi
    echo "Make virtual env..."
    virtualenv penv
fi
. penv/bin/activate

if [ ! -d "$NODEENVIRONMENTFOLDER" ]; then
    echo "Make node env..."
    pip install nodeenv
    nodeenv nenv
fi
. nenv/bin/activate

echo "Environments are initialized."
