eth="eth0"
proto="udp"
port="1194"
#OpenVPN
iptables -A INPUT -i "$eth" -m state --state NEW -p "$proto" --dport "$port" -j ACCEPT
# Allow TUN interface connection to OpenVPN server
iptables -A INPUT -i tun+ -j ACCEPT
# Allow TUN interface connection to be forward through other interfaces
iptables -A FORWARD -i tun+ -j ACCEPT 
iptables -A FORWARD -i tun+ -o "$eth" -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i "$eth" -o tun+ -m state --state RELATED,ESTABLISHED -j ACCEPT
# NAT the VPN client traffic to the internet
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o "$eth" -j MASQUERADE
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 127.0.0.53 -j ACCEPT
iptables -A INPUT -d 127.0.0.53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -s 10.128.0.0/24 -j ACCEPT
iptables -A INPUT -d 10.128.0.0/24 -j ACCEPT
iptables -A INPUT -j DROP
