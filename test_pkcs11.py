#!/usr/bin/env python3

import PyKCS11
import pkcs11
import os
import sys
import pytest

lib = pkcs11.lib(os.environ['PKCS11_MODULE'])
