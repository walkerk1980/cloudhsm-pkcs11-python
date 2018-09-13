#!/usr/bin/env python3
import pkcs11Lib
import os

def test_pkcs11Lib():
    pkcs11Lib.load_lib()
    lib_file='/opt/cloudhsm/lib/libcloudhsm_pkcs11.so'
    assert os.path.isfile(lib_file) == True
