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

def load_slot():
    pkcs11 = PyKCS11.PyKCS11Lib()
    pkcs11.load('/opt/cloudhsm/lib/libcloudhsm_pkcs11.so')
    slot = pkcs11.getSlotList()[0]
    return([slot, pkcs11])

def load_session():
    a = load_slot()
    slot = a[0]
    pkcs11 = a[1]
    session = pkcs11.openSession(slot, PyKCS11.CKF_RW_SESSION)
    return([slot, pkcs11, session])

def login_session():
    a = load_session()
    slot = a[0]
    pkcs11 = a[1]
    session = a[2]
    user = 'kwalker'
    passwd = 'L3tm31n!'
    credentials = user + ':' + passwd
    session.login(credentials)
    print()

