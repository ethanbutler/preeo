#!/bin/bash
openssl req \
    -x509 \
    -nodes \
    -newkey rsa:2048 \
    -keyout ssl/server.pem \
    -out ssl/server.pem \
    -days 3650 \
    -sha256 \
    -config <(cat <<EOF
[ req ]
prompt = no
distinguished_name = subject
x509_extensions    = x509_ext

[ subject ]
commonName = localhost

[ x509_ext ]
subjectAltName = @alternate_names

[ alternate_names ]
DNS.1 = localhost
IP.1 = 127.0.0.1
)
