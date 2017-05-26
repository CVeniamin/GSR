WEB_INTERFACE=eth2
USER_INTERFACES=eth0 eth1 eth3
PROXY_ADDR='10.0.2.84'
WEB_ADDR='10.0.2.83'

# Block outgoing HTTP(S) for everything but proxy server
for i in $USER_INTERFACES
 do
  iptables -t nat -A PREROUTING -i $i -p tcp -m multiport --dports 80,443 -j DNAT --to-destination $PROXY_ADDR:3128
done

# Block all outgoing and incoming traffic for private IPs
iptables -A FORWARD -s 192.168.0.0/28 -o $WEB_INTERFACE -j DROP
iptables -A FORWARD -d 192.168.0.0/28 -i $WEB_INTERFACE -j DROP

# Protect services from access from Internet
iptables -A FORWARD -d $PROXY_ADDR  -p tcp --dport 3128 -i $WEB_INTERFACE -j DROP

# Open public services for access from Internet
iptables -A FORWARD -p tcp -d $WEB_ADDR -m multiport --dports 80,443 -j ACCEPT # HTTP(S)
iptables -A FORWARD -p tcp -d $WEB_ADDR -m multiport --dports 80,443 -j ACCEPT # HTTP(S)
iptables -A FORWARD -p tcp -d $WEB_ADDR -m multiport --dports 80,443 -j ACCEPT # SMTP IMAP DNS SSH VPN
