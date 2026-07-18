# Python test file for linter
import os
import sys


def unused_function():
    pass


def test_function():
    x = 1
    y = 2
    print("Hello World")
    return x + y


# Unused variable
unused_var = "test"

test_function()
