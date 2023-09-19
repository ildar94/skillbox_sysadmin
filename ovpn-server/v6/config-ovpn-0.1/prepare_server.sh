#!/bin/bash
RSA_PATH="/opt/easy-rsa"
sudo ln -s /usr/share/easy-rsa/* $RSA_PATH/
chmod 700 $RSA_PATH
mkdir ~/tmp_share
cd $RSA_PATH

sudo chown -R ildar:ildar $RSA_PATH/
# create pki directory
echo -ne '\n' | ./easyrsa init-pki


# create request for sertificate
./easyrsa gen-req server nopass <<END
server
END

# send request certificate to trust-center
scp $RSA_PATH/pki/reqs/server.req ildar@trust-center:/opt/easy-rsa/pki/reqs/server.req

# signed certificate, then copy root and signed certificate to openvpn server
ssh ildar@trust-center "cd /opt/easy-rsa && echo -ne 'yes' | ./easyrsa sign-req server server"  

scp ildar@trust-center:/opt/easy-rsa/pki/issued/server.crt ~/tmp_share
scp ildar@trust-center:/opt/easy-rsa/pki/ca.crt ~/tmp_share

sudo cp ~/tmp_share/* /etc/openvpn/server/

/usr/sbin/openvpn --genkey --secret ta.key

sudo cp ta.key /etc/openvpn/server/

sudo rm ~/tmp_share/*




sudo cp ta.key /etc/openvpn/server/
sudo cp $RSA_PATH/pki/private/server.key /etc/openvpn/server/




# Enable openvpn service to autostart
sudo systemctl -f enable openvpn-server@server.service
sudo systemctl  start openvpn-server@server.service
sudo systemctl enable --now openvpn_exporter.service

