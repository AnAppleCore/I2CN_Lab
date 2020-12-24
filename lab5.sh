# create ns01
ip netns add ns01
# create ns02 
ip netns add ns02
# create a pair of veths named veth01 and veth10
ip link add veth01 type veth peer name veth10
# assign veth10 to ns01, veth01 remains on default ns
ip link set veth10 netns ns01
# set address for veth01 and then enable
ip addr add 10.0.0.1 peer 10.0.0.2 dev veth01
ifconfig veth01 up
# set address for veth10 and then enable
ip netns exec ns01 ip addr add 10.0.0.2 peer 10.0.0.1 dev veth10
ip netns exec ns01 ifconfig veth10 up

# at this moment you should be able to ping to 10.0.0.2

# create a pair of veths named veth12 and veth21
ip link add veth12 type veth peer name veth21
ip link set veth12 netns ns01
# assign veth12 to ns01, veth21 to ns02
ip link set veth21 netns ns02
ip netns exec ns01 ip addr add 10.0.0.3 peer 10.0.0.4 dev veth12
# set address for veth12 and then enable
ip netns exec ns01 ifconfig veth12 up
ip netns exec ns02 ip addr add 10.0.0.4 peer 10.0.0.3 dev veth21
# set address for veth21 and then enable
ip netns exec ns02 ifconfig veth21 up

# at this moment you should be able to ping to 10.0.0.4 on ns01

# enable packet forwarding on ns01
ip netns exec ns01 sysctl net.ipv4.ip_forward=1
# enable NAT on ns01
ip netns exec ns01 iptables -t nat -A POSTROUTING -o veth12 -j MASQUERADE
# add route on default ns
ip route add 10.0.0.4 via 10.0.0.2

# now you should be able to ping to 10.0.0.4, traceroute 10.0.0.4 should output a hop at 10.0.0.2 first