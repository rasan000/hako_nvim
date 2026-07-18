#!/bin/bash
# Shell script test file for linter

# This should trigger shellcheck warnings
echo $undefined_var

# Missing quotes around variable
if [ $HOME == "/home/user" ]; then
    echo "Home directory check"
fi

# Unused variable
unused_var="test"

echo "Script completed"
