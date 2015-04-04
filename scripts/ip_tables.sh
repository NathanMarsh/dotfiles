#!/bin/bash -xe

sudo iptables -F

sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -t nat -X
#sudo iptables -t mangle -F
#sudo iptables -t mangle -X
#sudo iptables -P INPUT ACCEPT
#sudo iptables -P FORWARD ACCEPT
#sudo iptables -P OUTPUT ACCEPT

sudo iptables -P INPUT DROP
sudo iptables -A INPUT -i lo -p all -j ACCEPT
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT 
sudo iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT 
sudo iptables -A INPUT -p tcp -m tcp --dport 8080 -j ACCEPT 

#sudo iptables -A OUTPUT -m owner --gid-owner no-internet -d 127.0.0.0/8 -j ACCEPT
#sudo iptables -A OUTPUT -m owner --gid-owner nointernet -d 127.0.0.1 -j ACCEPT
#sudo iptables -A OUTPUT -m owner --gid-owner nointernet -j DROP

#sudo iptables -I OUTPUT 1 -m owner --gid-owner no-internet -d 127.0.0.1 -j ACCEPT
#sudo iptables -I OUTPUT 2 -m owner --gid-owner no-internet -j DROP

sudo iptables -A OUTPUT -p tcp --sport 8080 -m state --state ESTABLISHED -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 2745 -j ACCEPT 
sudo iptables -A INPUT -j DROP

#sudo iptables -t nat -A OUTPUT -p all -d <MAKE_THIS_IP> -j DNAT --to-destination <GO_TO_THIS_IP_INSTEAD>
#sudo iptables -t nat -A OUTPUT -p all -d 123.45.67.89 -j DNAT --to-destination 127.0.0.1
sudo iptables -t nat -A OUTPUT -p all -d 10.42.9.164 -j DNAT --to-destination 127.0.0.1
sudo iptables -t nat -A OUTPUT -p all -d 10.199.178.204 -j DNAT --to-destination 127.0.0.1
#sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000 #forward local port 80 traffic to 3000 instead, useful to not run http as root (Can also be put in /etc/rc.local)
#sudo iptables -t nat -L #Check current nat rules


