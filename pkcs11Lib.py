#!/usr/bin/env python3

import PyKCS11
from PyKCS11 import *
import os
import sys
import pytest


def load_lib():
    pkcs11 = PyKCS11.PyKCS11Lib()


