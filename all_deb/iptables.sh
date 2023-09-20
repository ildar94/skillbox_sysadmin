#!/bin/bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -s 127.0.0.53 -j ACCEPT
iptables -A INPUT -d 127.0.0.53 -j ACCEPT
iptables -A INPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -s 10.128.0.0/24 -j ACCEPT
iptables -A INPUT -d 10.128.0.0/24 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -s 10.0.0.0/8 -j ACCEPT
iptables -A INPUT -j DROP

