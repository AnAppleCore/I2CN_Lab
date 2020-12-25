################################################################
###################### clear namespaces #######################
ip netns del ns01
ip netns del ns02
ip netns del ns03

################################################################
###################### create namespaces #######################
ip netns add ns01
ip netns add ns02
ip netns add ns03

################################################################
#################### create pairs of veths ####################
ip link add veth01 type veth peer name veth10
ip link add veth12 type veth peer name veth21
ip link add veth23 type veth peer name veth32

################################################################
###### assign veths to namespaces, set ip addresses, ... #######

# default ns
ip addr add 10.0.0.1 peer 10.0.0.2 dev veth01
ifconfig veth01 up

ip route add 10.0.0.4 via 10.0.0.2
ip route add 10.0.0.6 via 10.0.0.2

# ns01
ip link set veth10 netns ns01
ip link set veth12 netns ns01

ip netns exec ns01 ip addr add 10.0.0.2 peer 10.0.0.1 dev veth10
ip netns exec ns01 ifconfig veth10 up
ip netns exec ns01 ip addr add 10.0.0.3 peer 10.0.0.4 dev veth12
ip netns exec ns01 ifconfig veth12 up

ip netns exec ns01 sysctl net.ipv4.ip_forward=1
ip netns exec ns01 iptables -t nat -A POSTROUTING -o veth12 -j MASQUERADE

ip netns exec ns01 ip route add 10.0.0.6 via 10.0.0.4

# ns02
ip link set veth21 netns ns02
ip link set veth23 netns ns02

ip netns exec ns02 ip addr add 10.0.0.4 peer 10.0.0.3 dev veth21
ip netns exec ns02 ifconfig veth21 up
ip netns exec ns02 ip addr add 10.0.0.5 peer 10.0.0.6 dev veth23
ip netns exec ns02 ifconfig veth23 up

ip netns exec ns02 sysctl net.ipv4.ip_forward=1
ip netns exec ns02 iptables -t nat -A POSTROUTING -o veth23 -j MASQUERADE

# ns03 
ip link set veth32 netns ns03

ip netns exec ns03 ip addr add 10.0.0.6 peer 10.0.0.5 dev veth32
ip netns exec ns03 ifconfig veth32 up

################################################################
###################### dnsmasq settings ########################
# dnsmasq -h
# dnsmasq --addn-hosts=/home/aac/I2CN_lab/dnsmasq.hosts

echo 'no-hosts'>>/etc/dnsmasq.conf
echo 'addn-hosts=/home/aac/I2CN_lab/lab5.hosts'>>/etc/dnsmasq.conf

systemctl restart dnsmasq
dnsmasq --test

################################################################
############################ test ##############################
traceroute 10.0.0.6