#!/bin/bash
#UDP
REPO="https://raw.githubusercontent.com/gapesta/main/"
systemctl stop badvpn1.service
systemctl disable badvpn1.service
systemctl stop badvpn2.service
systemctl disable badvpn2.service
systemctl stop badvpn3.service
systemctl disable badvpn3.service
rm -f /etc/systemd/system/badvpn*.service
rm -f /usr/local/bin/badvpn-udpgw
systemctl daemon-reload
mkdir -p /usr/local/bin
wget -O /usr/local/bin/badvpn-udpgw "${REPO}badvpn" >/dev/null 2>&1
chmod +x /usr/local/bin/badvpn-udpgw > /dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn1.service "${REPO}badvpn1.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn2.service "${REPO}badvpn2.service" >/dev/null 2>&1
wget -q -O /etc/systemd/system/badvpn3.service "${REPO}badvpn3.service" >/dev/null 2>&1
systemctl disable badvpn1 
systemctl stop badvpn1 
systemctl enable badvpn1
systemctl start badvpn1 
systemctl disable badvpn2 
systemctl stop badvpn2 
systemctl enable badvpn2
systemctl start badvpn2 
systemctl disable badvpn3 
systemctl stop badvpn3 
systemctl enable badvpn3
systemctl start badvpn3 