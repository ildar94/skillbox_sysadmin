#!/bin/bash
RSA_PATH='/opt/easy-rsa'
CLIENT_PATH='/opt/openvpn/clients'
# First argument it is client's name

cd $RSA_PATH
./easyrsa gen-req $1 nopass <<END
$1
END

cp pki/private/$1.key $CLIENT_PATH/keys/

scp $RSA_PATH/pki/reqs/$1.req ildar@trust-center:/opt/easy-rsa/pki/reqs/$1.req
ssh ildar@trust-center "cd /opt/easy-rsa && echo -ne 'yes' | ./easyrsa sign-req client $1"
scp ildar@trust-center:/opt/easy-rsa/pki/issued/$1.crt $CLIENT_PATH/keys/
scp ildar@trust-center:/opt/easy-rsa/pki/ca.crt $CLIENT_PATH/keys/
cp ta.key $CLIENT_PATH/keys/


