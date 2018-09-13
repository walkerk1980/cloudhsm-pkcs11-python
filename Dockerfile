FROM walkerk1980/cloudhsm-pkcs11
WORKDIR /root/
RUN /usr/bin/pip3 install pytest
#RUN /usr/bin/pip3 install python-pkcs11
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" --assume-yes -y --yes -f install -y \ 
  python3-pykcs11 \
  && rm -rf /var/lib/apt/lists/*
COPY pkcs11Lib.py test_pkcs11Lib.py pkcs11Login.py /root/
ENV CAKEYPASS=Password1
ENV CASUBJECT=example.com
ENV REGION=us-west-2
ENV PKCS11_MODULE=/opt/cloudhsm/lib/libcloudhsm_pkcs11.so
RUN /usr/local/bin/pytest test_pkcs11Lib.py
