FROM walkerk1980/cloudhsm-pkcs11
WORKDIR /root/
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" --assume-yes -y --yes -f install -y \ 
  python3-pykcs11 \
  && rm -rf /var/lib/apt/lists/*
COPY test_pkcs11.py /root/test_pkcs11.py
ENV CAKEYPASS=Password1
ENV CASUBJECT=example.com
ENV REGION=us-west-2
ENV PKCS11_MODULE=/opt/cloudhsm/lib/libcloudhsm_pkcs11.so
