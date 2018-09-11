FROM walkerk1980/cloudhsm-pkcs11
WORKDIR /root/
RUN /usr/bin/pip3 install python-pkcs11
ENV CAKEYPASS=Password1
ENV CASUBJECT=example.com
ENV REGION=us-west-2
ENV PKCS11_MODULE=/opt/cloudhsm/lib/libcloudhsm_pkcs11.so
