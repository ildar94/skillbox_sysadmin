#!/bin/bash
PATH_RSA="/../../opt/easy-rsa/"

#create simlink from standart directory to our created directory
ln -s /usr/share/easy-rsa/* $PATH_RSA
chmod 700 $PATH_RSA
cd $PATH_RSA
echo -ne '\n' | ./easyrsa init-pki
echo -ne '\n' | ./easyrsa build-ca nopass 
chown -R ildar:ildar /opt/easy-rsa/
