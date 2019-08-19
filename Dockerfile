FROM walkerk1980/cloudhsm-pkcs11
WORKDIR /root/
#RUN /usr/bin/pip3 install --upgrade pip
RUN /usr/bin/pip3 install pytest PyKCS11
#RUN /usr/bin/pip3 install pytest python-pkcs11
COPY pkcs11Lib.py test_pkcs11Lib.py pkcs11Login.py test_pkcs11Login.py /root/
ENV CAKEYPASS=Password1
ENV CASUBJECT=example.com
ENV REGION=us-west-2
ENV PKCS11_MODULE=/opt/cloudhsm/lib/libcloudhsm_pkcs11.so
RUN /usr/local/bin/pytest test_pkcs11Lib.py
