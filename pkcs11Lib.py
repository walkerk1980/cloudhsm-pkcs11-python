#!/usr/bin/env python3

import PyKCS11
from PyKCS11 import *
import os
import sys
import pytest


def load_lib():
    pkcs11 = PyKCS11.PyKCS11Lib()
    pkcs11.load('/opt/cloudhsm/lib/libcloudhsm_pkcs11.so')
    libInfo=pkcs11.getInfo()
    print(libInfo)


