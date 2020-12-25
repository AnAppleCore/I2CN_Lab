ip netns del ns01
ip netns add ns01
ip netns del ns02
ip netns add ns02
ip netns del ns03
ip netns add ns03
ip netns del ns04
ip netns add ns04
ip netns del ns05
ip netns add ns05
ip netns del ns06
ip netns add ns06
ip netns del ns07
ip netns add ns07
ip netns del ns08
ip netns add ns08
ip netns del ns09
ip netns add ns09
ip netns del ns010
ip netns add ns010
ip netns del ns011
ip netns add ns011
ip netns del ns012
ip netns add ns012
ip netns del ns013
ip netns add ns013
ip netns del ns014
ip netns add ns014
ip netns del ns015
ip netns add ns015
ip netns del ns016
ip netns add ns016
ip netns del ns017
ip netns add ns017
ip netns del ns018
ip netns add ns018
ip netns del ns019
ip netns add ns019
ip netns del ns020
ip netns add ns020
ip netns del ns021
ip netns add ns021
ip netns del ns022
ip netns add ns022
ip netns del ns023
ip netns add ns023
ip netns del ns024
ip netns add ns024
ip netns del ns025
ip netns add ns025
ip netns del ns026
ip netns add ns026
ip netns del ns027
ip netns add ns027
ip netns del ns028
ip netns add ns028
ip netns del ns029
ip netns add ns029
ip netns del ns030
ip netns add ns030
ip netns del ns031
ip netns add ns031
ip netns del ns032
ip netns add ns032
ip netns del ns033
ip netns add ns033
ip netns del ns034
ip netns add ns034

ip link add veth01 type veth peer name veth10
ip link add veth12 type veth peer name veth21
ip link add veth23 type veth peer name veth32
ip link add veth34 type veth peer name veth43
ip link add veth45 type veth peer name veth54
ip link add veth56 type veth peer name veth65
ip link add veth67 type veth peer name veth76
ip link add veth78 type veth peer name veth87
ip link add veth89 type veth peer name veth98
ip link add veth910 type veth peer name veth109
ip link add veth1011 type veth peer name veth1110
ip link add veth1112 type veth peer name veth1211
ip link add veth1213 type veth peer name veth1312
ip link add veth1314 type veth peer name veth1413
ip link add veth1415 type veth peer name veth1514
ip link add veth1516 type veth peer name veth1615
ip link add veth1617 type veth peer name veth1716
ip link add veth1718 type veth peer name veth1817
ip link add veth1819 type veth peer name veth1918
ip link add veth1920 type veth peer name veth2019
ip link add veth2021 type veth peer name veth2120
ip link add veth2122 type veth peer name veth2221
ip link add veth2223 type veth peer name veth2322
ip link add veth2324 type veth peer name veth2423
ip link add veth2425 type veth peer name veth2524
ip link add veth2526 type veth peer name veth2625
ip link add veth2627 type veth peer name veth2726
ip link add veth2728 type veth peer name veth2827
ip link add veth2829 type veth peer name veth2928
ip link add veth2930 type veth peer name veth3029
ip link add veth3031 type veth peer name veth3130
ip link add veth3132 type veth peer name veth3231
ip link add veth3233 type veth peer name veth3332
ip link add veth3334 type veth peer name veth3433

# default ns
ip addr add 10.0.0.1 peer 10.0.0.2 dev veth01
ifconfig veth01 up
ip route add 10.0.0.4 via 10.0.0.2
ip route add 10.0.0.6 via 10.0.0.2
ip route add 10.0.0.8 via 10.0.0.2
ip route add 10.0.0.10 via 10.0.0.2
ip route add 10.0.0.12 via 10.0.0.2
ip route add 10.0.0.14 via 10.0.0.2
ip route add 10.0.0.16 via 10.0.0.2
ip route add 10.0.0.18 via 10.0.0.2
ip route add 10.0.0.20 via 10.0.0.2
ip route add 10.0.0.22 via 10.0.0.2
ip route add 10.0.0.24 via 10.0.0.2
ip route add 10.0.0.26 via 10.0.0.2
ip route add 10.0.0.28 via 10.0.0.2
ip route add 10.0.0.30 via 10.0.0.2
ip route add 10.0.0.32 via 10.0.0.2
ip route add 10.0.0.34 via 10.0.0.2
ip route add 10.0.0.36 via 10.0.0.2
ip route add 10.0.0.38 via 10.0.0.2
ip route add 10.0.0.40 via 10.0.0.2
ip route add 10.0.0.42 via 10.0.0.2
ip route add 10.0.0.44 via 10.0.0.2
ip route add 10.0.0.46 via 10.0.0.2
ip route add 10.0.0.48 via 10.0.0.2
ip route add 10.0.0.50 via 10.0.0.2
ip route add 10.0.0.52 via 10.0.0.2
ip route add 10.0.0.54 via 10.0.0.2
ip route add 10.0.0.56 via 10.0.0.2
ip route add 10.0.0.58 via 10.0.0.2
ip route add 10.0.0.60 via 10.0.0.2
ip route add 10.0.0.62 via 10.0.0.2
ip route add 10.0.0.64 via 10.0.0.2
ip route add 10.0.0.66 via 10.0.0.2
ip route add 10.0.0.68 via 10.0.0.2

# ns01
ip link set veth10 netns ns01
ip link set veth12 netns ns01
ip netns exec ns01 ip addr add 10.0.0.2 peer 10.0.0.1 dev veth10
ip netns exec ns01 ifconfig veth10 up
ip netns exec ns01 ip addr add 10.0.0.3 peer 10.0.0.4 dev veth12
ip netns exec ns01 ifconfig veth10 up
ip netns exec ns01 sysctl net.ipv4.ip_forward=1
ip netns exec ns01 iptables -t nat -A POSTROUTING -o veth12 -j MASQUERADE
ip netns exec ns01 ip route add 10.0.0.6 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.8 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.10 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.12 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.14 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.16 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.18 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.20 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.22 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.24 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.26 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.28 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.30 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.32 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.34 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.36 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.38 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.40 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.42 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.44 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.46 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.48 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.50 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.52 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.54 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.56 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.58 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.60 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.62 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.64 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.66 via 10.0.0.4
ip netns exec ns01 ip route add 10.0.0.68 via 10.0.0.4

# ns02
ip link set veth21 netns ns02
ip link set veth23 netns ns02
ip netns exec ns02 ip addr add 10.0.0.4 peer 10.0.0.3 dev veth21
ip netns exec ns02 ifconfig veth21 up
ip netns exec ns02 ip addr add 10.0.0.5 peer 10.0.0.6 dev veth23
ip netns exec ns02 ifconfig veth21 up
ip netns exec ns02 sysctl net.ipv4.ip_forward=1
ip netns exec ns02 iptables -t nat -A POSTROUTING -o veth23 -j MASQUERADE
ip netns exec ns02 ip route add 10.0.0.8 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.10 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.12 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.14 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.16 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.18 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.20 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.22 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.24 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.26 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.28 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.30 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.32 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.34 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.36 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.38 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.40 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.42 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.44 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.46 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.48 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.50 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.52 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.54 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.56 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.58 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.60 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.62 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.64 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.66 via 10.0.0.6
ip netns exec ns02 ip route add 10.0.0.68 via 10.0.0.6

# ns03
ip link set veth32 netns ns03
ip link set veth34 netns ns03
ip netns exec ns03 ip addr add 10.0.0.6 peer 10.0.0.5 dev veth32
ip netns exec ns03 ifconfig veth32 up
ip netns exec ns03 ip addr add 10.0.0.7 peer 10.0.0.8 dev veth34
ip netns exec ns03 ifconfig veth32 up
ip netns exec ns03 sysctl net.ipv4.ip_forward=1
ip netns exec ns03 iptables -t nat -A POSTROUTING -o veth34 -j MASQUERADE
ip netns exec ns03 ip route add 10.0.0.10 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.12 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.14 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.16 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.18 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.20 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.22 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.24 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.26 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.28 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.30 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.32 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.34 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.36 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.38 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.40 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.42 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.44 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.46 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.48 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.50 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.52 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.54 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.56 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.58 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.60 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.62 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.64 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.66 via 10.0.0.8
ip netns exec ns03 ip route add 10.0.0.68 via 10.0.0.8

# ns04
ip link set veth43 netns ns04
ip link set veth45 netns ns04
ip netns exec ns04 ip addr add 10.0.0.8 peer 10.0.0.7 dev veth43
ip netns exec ns04 ifconfig veth43 up
ip netns exec ns04 ip addr add 10.0.0.9 peer 10.0.0.10 dev veth45
ip netns exec ns04 ifconfig veth43 up
ip netns exec ns04 sysctl net.ipv4.ip_forward=1
ip netns exec ns04 iptables -t nat -A POSTROUTING -o veth45 -j MASQUERADE
ip netns exec ns04 ip route add 10.0.0.12 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.14 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.16 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.18 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.20 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.22 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.24 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.26 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.28 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.30 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.32 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.34 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.36 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.38 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.40 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.42 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.44 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.46 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.48 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.50 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.52 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.54 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.56 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.58 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.60 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.62 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.64 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.66 via 10.0.0.10
ip netns exec ns04 ip route add 10.0.0.68 via 10.0.0.10

# ns05
ip link set veth54 netns ns05
ip link set veth56 netns ns05
ip netns exec ns05 ip addr add 10.0.0.10 peer 10.0.0.9 dev veth54
ip netns exec ns05 ifconfig veth54 up
ip netns exec ns05 ip addr add 10.0.0.11 peer 10.0.0.12 dev veth56
ip netns exec ns05 ifconfig veth54 up
ip netns exec ns05 sysctl net.ipv4.ip_forward=1
ip netns exec ns05 iptables -t nat -A POSTROUTING -o veth56 -j MASQUERADE
ip netns exec ns05 ip route add 10.0.0.14 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.16 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.18 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.20 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.22 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.24 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.26 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.28 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.30 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.32 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.34 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.36 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.38 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.40 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.42 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.44 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.46 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.48 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.50 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.52 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.54 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.56 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.58 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.60 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.62 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.64 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.66 via 10.0.0.12
ip netns exec ns05 ip route add 10.0.0.68 via 10.0.0.12

# ns06
ip link set veth65 netns ns06
ip link set veth67 netns ns06
ip netns exec ns06 ip addr add 10.0.0.12 peer 10.0.0.11 dev veth65
ip netns exec ns06 ifconfig veth65 up
ip netns exec ns06 ip addr add 10.0.0.13 peer 10.0.0.14 dev veth67
ip netns exec ns06 ifconfig veth65 up
ip netns exec ns06 sysctl net.ipv4.ip_forward=1
ip netns exec ns06 iptables -t nat -A POSTROUTING -o veth67 -j MASQUERADE
ip netns exec ns06 ip route add 10.0.0.16 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.18 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.20 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.22 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.24 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.26 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.28 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.30 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.32 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.34 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.36 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.38 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.40 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.42 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.44 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.46 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.48 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.50 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.52 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.54 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.56 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.58 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.60 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.62 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.64 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.66 via 10.0.0.14
ip netns exec ns06 ip route add 10.0.0.68 via 10.0.0.14

# ns07
ip link set veth76 netns ns07
ip link set veth78 netns ns07
ip netns exec ns07 ip addr add 10.0.0.14 peer 10.0.0.13 dev veth76
ip netns exec ns07 ifconfig veth76 up
ip netns exec ns07 ip addr add 10.0.0.15 peer 10.0.0.16 dev veth78
ip netns exec ns07 ifconfig veth76 up
ip netns exec ns07 sysctl net.ipv4.ip_forward=1
ip netns exec ns07 iptables -t nat -A POSTROUTING -o veth78 -j MASQUERADE
ip netns exec ns07 ip route add 10.0.0.18 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.20 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.22 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.24 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.26 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.28 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.30 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.32 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.34 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.36 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.38 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.40 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.42 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.44 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.46 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.48 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.50 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.52 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.54 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.56 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.58 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.60 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.62 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.64 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.66 via 10.0.0.16
ip netns exec ns07 ip route add 10.0.0.68 via 10.0.0.16

# ns08
ip link set veth87 netns ns08
ip link set veth89 netns ns08
ip netns exec ns08 ip addr add 10.0.0.16 peer 10.0.0.15 dev veth87
ip netns exec ns08 ifconfig veth87 up
ip netns exec ns08 ip addr add 10.0.0.17 peer 10.0.0.18 dev veth89
ip netns exec ns08 ifconfig veth87 up
ip netns exec ns08 sysctl net.ipv4.ip_forward=1
ip netns exec ns08 iptables -t nat -A POSTROUTING -o veth89 -j MASQUERADE
ip netns exec ns08 ip route add 10.0.0.20 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.22 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.24 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.26 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.28 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.30 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.32 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.34 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.36 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.38 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.40 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.42 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.44 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.46 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.48 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.50 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.52 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.54 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.56 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.58 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.60 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.62 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.64 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.66 via 10.0.0.18
ip netns exec ns08 ip route add 10.0.0.68 via 10.0.0.18

# ns09
ip link set veth98 netns ns09
ip link set veth910 netns ns09
ip netns exec ns09 ip addr add 10.0.0.18 peer 10.0.0.17 dev veth98
ip netns exec ns09 ifconfig veth98 up
ip netns exec ns09 ip addr add 10.0.0.19 peer 10.0.0.20 dev veth910
ip netns exec ns09 ifconfig veth98 up
ip netns exec ns09 sysctl net.ipv4.ip_forward=1
ip netns exec ns09 iptables -t nat -A POSTROUTING -o veth910 -j MASQUERADE
ip netns exec ns09 ip route add 10.0.0.22 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.24 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.26 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.28 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.30 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.32 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.34 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.36 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.38 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.40 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.42 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.44 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.46 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.48 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.50 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.52 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.54 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.56 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.58 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.60 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.62 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.64 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.66 via 10.0.0.20
ip netns exec ns09 ip route add 10.0.0.68 via 10.0.0.20

# ns010
ip link set veth109 netns ns010
ip link set veth1011 netns ns010
ip netns exec ns010 ip addr add 10.0.0.20 peer 10.0.0.19 dev veth109
ip netns exec ns010 ifconfig veth109 up
ip netns exec ns010 ip addr add 10.0.0.21 peer 10.0.0.22 dev veth1011
ip netns exec ns010 ifconfig veth109 up
ip netns exec ns010 sysctl net.ipv4.ip_forward=1
ip netns exec ns010 iptables -t nat -A POSTROUTING -o veth1011 -j MASQUERADE
ip netns exec ns010 ip route add 10.0.0.24 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.26 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.28 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.30 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.32 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.34 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.36 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.38 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.40 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.42 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.44 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.46 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.48 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.50 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.52 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.54 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.56 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.58 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.60 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.62 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.64 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.66 via 10.0.0.22
ip netns exec ns010 ip route add 10.0.0.68 via 10.0.0.22

# ns011
ip link set veth1110 netns ns011
ip link set veth1112 netns ns011
ip netns exec ns011 ip addr add 10.0.0.22 peer 10.0.0.21 dev veth1110
ip netns exec ns011 ifconfig veth1110 up
ip netns exec ns011 ip addr add 10.0.0.23 peer 10.0.0.24 dev veth1112
ip netns exec ns011 ifconfig veth1110 up
ip netns exec ns011 sysctl net.ipv4.ip_forward=1
ip netns exec ns011 iptables -t nat -A POSTROUTING -o veth1112 -j MASQUERADE
ip netns exec ns011 ip route add 10.0.0.26 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.28 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.30 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.32 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.34 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.36 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.38 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.40 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.42 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.44 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.46 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.48 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.50 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.52 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.54 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.56 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.58 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.60 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.62 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.64 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.66 via 10.0.0.24
ip netns exec ns011 ip route add 10.0.0.68 via 10.0.0.24

# ns012
ip link set veth1211 netns ns012
ip link set veth1213 netns ns012
ip netns exec ns012 ip addr add 10.0.0.24 peer 10.0.0.23 dev veth1211
ip netns exec ns012 ifconfig veth1211 up
ip netns exec ns012 ip addr add 10.0.0.25 peer 10.0.0.26 dev veth1213
ip netns exec ns012 ifconfig veth1211 up
ip netns exec ns012 sysctl net.ipv4.ip_forward=1
ip netns exec ns012 iptables -t nat -A POSTROUTING -o veth1213 -j MASQUERADE
ip netns exec ns012 ip route add 10.0.0.28 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.30 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.32 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.34 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.36 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.38 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.40 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.42 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.44 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.46 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.48 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.50 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.52 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.54 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.56 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.58 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.60 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.62 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.64 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.66 via 10.0.0.26
ip netns exec ns012 ip route add 10.0.0.68 via 10.0.0.26

# ns013
ip link set veth1312 netns ns013
ip link set veth1314 netns ns013
ip netns exec ns013 ip addr add 10.0.0.26 peer 10.0.0.25 dev veth1312
ip netns exec ns013 ifconfig veth1312 up
ip netns exec ns013 ip addr add 10.0.0.27 peer 10.0.0.28 dev veth1314
ip netns exec ns013 ifconfig veth1312 up
ip netns exec ns013 sysctl net.ipv4.ip_forward=1
ip netns exec ns013 iptables -t nat -A POSTROUTING -o veth1314 -j MASQUERADE
ip netns exec ns013 ip route add 10.0.0.30 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.32 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.34 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.36 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.38 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.40 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.42 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.44 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.46 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.48 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.50 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.52 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.54 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.56 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.58 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.60 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.62 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.64 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.66 via 10.0.0.28
ip netns exec ns013 ip route add 10.0.0.68 via 10.0.0.28

# ns014
ip link set veth1413 netns ns014
ip link set veth1415 netns ns014
ip netns exec ns014 ip addr add 10.0.0.28 peer 10.0.0.27 dev veth1413
ip netns exec ns014 ifconfig veth1413 up
ip netns exec ns014 ip addr add 10.0.0.29 peer 10.0.0.30 dev veth1415
ip netns exec ns014 ifconfig veth1413 up
ip netns exec ns014 sysctl net.ipv4.ip_forward=1
ip netns exec ns014 iptables -t nat -A POSTROUTING -o veth1415 -j MASQUERADE
ip netns exec ns014 ip route add 10.0.0.32 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.34 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.36 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.38 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.40 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.42 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.44 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.46 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.48 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.50 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.52 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.54 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.56 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.58 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.60 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.62 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.64 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.66 via 10.0.0.30
ip netns exec ns014 ip route add 10.0.0.68 via 10.0.0.30

# ns015
ip link set veth1514 netns ns015
ip link set veth1516 netns ns015
ip netns exec ns015 ip addr add 10.0.0.30 peer 10.0.0.29 dev veth1514
ip netns exec ns015 ifconfig veth1514 up
ip netns exec ns015 ip addr add 10.0.0.31 peer 10.0.0.32 dev veth1516
ip netns exec ns015 ifconfig veth1514 up
ip netns exec ns015 sysctl net.ipv4.ip_forward=1
ip netns exec ns015 iptables -t nat -A POSTROUTING -o veth1516 -j MASQUERADE
ip netns exec ns015 ip route add 10.0.0.34 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.36 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.38 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.40 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.42 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.44 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.46 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.48 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.50 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.52 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.54 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.56 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.58 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.60 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.62 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.64 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.66 via 10.0.0.32
ip netns exec ns015 ip route add 10.0.0.68 via 10.0.0.32

# ns016
ip link set veth1615 netns ns016
ip link set veth1617 netns ns016
ip netns exec ns016 ip addr add 10.0.0.32 peer 10.0.0.31 dev veth1615
ip netns exec ns016 ifconfig veth1615 up
ip netns exec ns016 ip addr add 10.0.0.33 peer 10.0.0.34 dev veth1617
ip netns exec ns016 ifconfig veth1615 up
ip netns exec ns016 sysctl net.ipv4.ip_forward=1
ip netns exec ns016 iptables -t nat -A POSTROUTING -o veth1617 -j MASQUERADE
ip netns exec ns016 ip route add 10.0.0.36 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.38 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.40 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.42 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.44 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.46 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.48 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.50 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.52 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.54 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.56 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.58 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.60 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.62 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.64 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.66 via 10.0.0.34
ip netns exec ns016 ip route add 10.0.0.68 via 10.0.0.34

# ns017
ip link set veth1716 netns ns017
ip link set veth1718 netns ns017
ip netns exec ns017 ip addr add 10.0.0.34 peer 10.0.0.33 dev veth1716
ip netns exec ns017 ifconfig veth1716 up
ip netns exec ns017 ip addr add 10.0.0.35 peer 10.0.0.36 dev veth1718
ip netns exec ns017 ifconfig veth1716 up
ip netns exec ns017 sysctl net.ipv4.ip_forward=1
ip netns exec ns017 iptables -t nat -A POSTROUTING -o veth1718 -j MASQUERADE
ip netns exec ns017 ip route add 10.0.0.38 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.40 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.42 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.44 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.46 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.48 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.50 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.52 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.54 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.56 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.58 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.60 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.62 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.64 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.66 via 10.0.0.36
ip netns exec ns017 ip route add 10.0.0.68 via 10.0.0.36

# ns018
ip link set veth1817 netns ns018
ip link set veth1819 netns ns018
ip netns exec ns018 ip addr add 10.0.0.36 peer 10.0.0.35 dev veth1817
ip netns exec ns018 ifconfig veth1817 up
ip netns exec ns018 ip addr add 10.0.0.37 peer 10.0.0.38 dev veth1819
ip netns exec ns018 ifconfig veth1817 up
ip netns exec ns018 sysctl net.ipv4.ip_forward=1
ip netns exec ns018 iptables -t nat -A POSTROUTING -o veth1819 -j MASQUERADE
ip netns exec ns018 ip route add 10.0.0.40 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.42 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.44 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.46 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.48 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.50 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.52 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.54 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.56 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.58 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.60 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.62 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.64 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.66 via 10.0.0.38
ip netns exec ns018 ip route add 10.0.0.68 via 10.0.0.38

# ns019
ip link set veth1918 netns ns019
ip link set veth1920 netns ns019
ip netns exec ns019 ip addr add 10.0.0.38 peer 10.0.0.37 dev veth1918
ip netns exec ns019 ifconfig veth1918 up
ip netns exec ns019 ip addr add 10.0.0.39 peer 10.0.0.40 dev veth1920
ip netns exec ns019 ifconfig veth1918 up
ip netns exec ns019 sysctl net.ipv4.ip_forward=1
ip netns exec ns019 iptables -t nat -A POSTROUTING -o veth1920 -j MASQUERADE
ip netns exec ns019 ip route add 10.0.0.42 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.44 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.46 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.48 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.50 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.52 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.54 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.56 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.58 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.60 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.62 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.64 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.66 via 10.0.0.40
ip netns exec ns019 ip route add 10.0.0.68 via 10.0.0.40

# ns020
ip link set veth2019 netns ns020
ip link set veth2021 netns ns020
ip netns exec ns020 ip addr add 10.0.0.40 peer 10.0.0.39 dev veth2019
ip netns exec ns020 ifconfig veth2019 up
ip netns exec ns020 ip addr add 10.0.0.41 peer 10.0.0.42 dev veth2021
ip netns exec ns020 ifconfig veth2019 up
ip netns exec ns020 sysctl net.ipv4.ip_forward=1
ip netns exec ns020 iptables -t nat -A POSTROUTING -o veth2021 -j MASQUERADE
ip netns exec ns020 ip route add 10.0.0.44 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.46 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.48 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.50 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.52 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.54 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.56 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.58 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.60 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.62 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.64 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.66 via 10.0.0.42
ip netns exec ns020 ip route add 10.0.0.68 via 10.0.0.42

# ns021
ip link set veth2120 netns ns021
ip link set veth2122 netns ns021
ip netns exec ns021 ip addr add 10.0.0.42 peer 10.0.0.41 dev veth2120
ip netns exec ns021 ifconfig veth2120 up
ip netns exec ns021 ip addr add 10.0.0.43 peer 10.0.0.44 dev veth2122
ip netns exec ns021 ifconfig veth2120 up
ip netns exec ns021 sysctl net.ipv4.ip_forward=1
ip netns exec ns021 iptables -t nat -A POSTROUTING -o veth2122 -j MASQUERADE
ip netns exec ns021 ip route add 10.0.0.46 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.48 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.50 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.52 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.54 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.56 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.58 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.60 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.62 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.64 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.66 via 10.0.0.44
ip netns exec ns021 ip route add 10.0.0.68 via 10.0.0.44

# ns022
ip link set veth2221 netns ns022
ip link set veth2223 netns ns022
ip netns exec ns022 ip addr add 10.0.0.44 peer 10.0.0.43 dev veth2221
ip netns exec ns022 ifconfig veth2221 up
ip netns exec ns022 ip addr add 10.0.0.45 peer 10.0.0.46 dev veth2223
ip netns exec ns022 ifconfig veth2221 up
ip netns exec ns022 sysctl net.ipv4.ip_forward=1
ip netns exec ns022 iptables -t nat -A POSTROUTING -o veth2223 -j MASQUERADE
ip netns exec ns022 ip route add 10.0.0.48 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.50 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.52 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.54 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.56 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.58 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.60 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.62 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.64 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.66 via 10.0.0.46
ip netns exec ns022 ip route add 10.0.0.68 via 10.0.0.46

# ns023
ip link set veth2322 netns ns023
ip link set veth2324 netns ns023
ip netns exec ns023 ip addr add 10.0.0.46 peer 10.0.0.45 dev veth2322
ip netns exec ns023 ifconfig veth2322 up
ip netns exec ns023 ip addr add 10.0.0.47 peer 10.0.0.48 dev veth2324
ip netns exec ns023 ifconfig veth2322 up
ip netns exec ns023 sysctl net.ipv4.ip_forward=1
ip netns exec ns023 iptables -t nat -A POSTROUTING -o veth2324 -j MASQUERADE
ip netns exec ns023 ip route add 10.0.0.50 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.52 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.54 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.56 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.58 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.60 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.62 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.64 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.66 via 10.0.0.48
ip netns exec ns023 ip route add 10.0.0.68 via 10.0.0.48

# ns024
ip link set veth2423 netns ns024
ip link set veth2425 netns ns024
ip netns exec ns024 ip addr add 10.0.0.48 peer 10.0.0.47 dev veth2423
ip netns exec ns024 ifconfig veth2423 up
ip netns exec ns024 ip addr add 10.0.0.49 peer 10.0.0.50 dev veth2425
ip netns exec ns024 ifconfig veth2423 up
ip netns exec ns024 sysctl net.ipv4.ip_forward=1
ip netns exec ns024 iptables -t nat -A POSTROUTING -o veth2425 -j MASQUERADE
ip netns exec ns024 ip route add 10.0.0.52 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.54 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.56 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.58 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.60 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.62 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.64 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.66 via 10.0.0.50
ip netns exec ns024 ip route add 10.0.0.68 via 10.0.0.50

# ns025
ip link set veth2524 netns ns025
ip link set veth2526 netns ns025
ip netns exec ns025 ip addr add 10.0.0.50 peer 10.0.0.49 dev veth2524
ip netns exec ns025 ifconfig veth2524 up
ip netns exec ns025 ip addr add 10.0.0.51 peer 10.0.0.52 dev veth2526
ip netns exec ns025 ifconfig veth2524 up
ip netns exec ns025 sysctl net.ipv4.ip_forward=1
ip netns exec ns025 iptables -t nat -A POSTROUTING -o veth2526 -j MASQUERADE
ip netns exec ns025 ip route add 10.0.0.54 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.56 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.58 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.60 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.62 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.64 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.66 via 10.0.0.52
ip netns exec ns025 ip route add 10.0.0.68 via 10.0.0.52

# ns026
ip link set veth2625 netns ns026
ip link set veth2627 netns ns026
ip netns exec ns026 ip addr add 10.0.0.52 peer 10.0.0.51 dev veth2625
ip netns exec ns026 ifconfig veth2625 up
ip netns exec ns026 ip addr add 10.0.0.53 peer 10.0.0.54 dev veth2627
ip netns exec ns026 ifconfig veth2625 up
ip netns exec ns026 sysctl net.ipv4.ip_forward=1
ip netns exec ns026 iptables -t nat -A POSTROUTING -o veth2627 -j MASQUERADE
ip netns exec ns026 ip route add 10.0.0.56 via 10.0.0.54
ip netns exec ns026 ip route add 10.0.0.58 via 10.0.0.54
ip netns exec ns026 ip route add 10.0.0.60 via 10.0.0.54
ip netns exec ns026 ip route add 10.0.0.62 via 10.0.0.54
ip netns exec ns026 ip route add 10.0.0.64 via 10.0.0.54
ip netns exec ns026 ip route add 10.0.0.66 via 10.0.0.54
ip netns exec ns026 ip route add 10.0.0.68 via 10.0.0.54

# ns027
ip link set veth2726 netns ns027
ip link set veth2728 netns ns027
ip netns exec ns027 ip addr add 10.0.0.54 peer 10.0.0.53 dev veth2726
ip netns exec ns027 ifconfig veth2726 up
ip netns exec ns027 ip addr add 10.0.0.55 peer 10.0.0.56 dev veth2728
ip netns exec ns027 ifconfig veth2726 up
ip netns exec ns027 sysctl net.ipv4.ip_forward=1
ip netns exec ns027 iptables -t nat -A POSTROUTING -o veth2728 -j MASQUERADE
ip netns exec ns027 ip route add 10.0.0.58 via 10.0.0.56
ip netns exec ns027 ip route add 10.0.0.60 via 10.0.0.56
ip netns exec ns027 ip route add 10.0.0.62 via 10.0.0.56
ip netns exec ns027 ip route add 10.0.0.64 via 10.0.0.56
ip netns exec ns027 ip route add 10.0.0.66 via 10.0.0.56
ip netns exec ns027 ip route add 10.0.0.68 via 10.0.0.56

# ns028
ip link set veth2827 netns ns028
ip link set veth2829 netns ns028
ip netns exec ns028 ip addr add 10.0.0.56 peer 10.0.0.55 dev veth2827
ip netns exec ns028 ifconfig veth2827 up
ip netns exec ns028 ip addr add 10.0.0.57 peer 10.0.0.58 dev veth2829
ip netns exec ns028 ifconfig veth2827 up
ip netns exec ns028 sysctl net.ipv4.ip_forward=1
ip netns exec ns028 iptables -t nat -A POSTROUTING -o veth2829 -j MASQUERADE
ip netns exec ns028 ip route add 10.0.0.60 via 10.0.0.58
ip netns exec ns028 ip route add 10.0.0.62 via 10.0.0.58
ip netns exec ns028 ip route add 10.0.0.64 via 10.0.0.58
ip netns exec ns028 ip route add 10.0.0.66 via 10.0.0.58
ip netns exec ns028 ip route add 10.0.0.68 via 10.0.0.58

# ns029
ip link set veth2928 netns ns029
ip link set veth2930 netns ns029
ip netns exec ns029 ip addr add 10.0.0.58 peer 10.0.0.57 dev veth2928
ip netns exec ns029 ifconfig veth2928 up
ip netns exec ns029 ip addr add 10.0.0.59 peer 10.0.0.60 dev veth2930
ip netns exec ns029 ifconfig veth2928 up
ip netns exec ns029 sysctl net.ipv4.ip_forward=1
ip netns exec ns029 iptables -t nat -A POSTROUTING -o veth2930 -j MASQUERADE
ip netns exec ns029 ip route add 10.0.0.62 via 10.0.0.60
ip netns exec ns029 ip route add 10.0.0.64 via 10.0.0.60
ip netns exec ns029 ip route add 10.0.0.66 via 10.0.0.60
ip netns exec ns029 ip route add 10.0.0.68 via 10.0.0.60

# ns030
ip link set veth3029 netns ns030
ip link set veth3031 netns ns030
ip netns exec ns030 ip addr add 10.0.0.60 peer 10.0.0.59 dev veth3029
ip netns exec ns030 ifconfig veth3029 up
ip netns exec ns030 ip addr add 10.0.0.61 peer 10.0.0.62 dev veth3031
ip netns exec ns030 ifconfig veth3029 up
ip netns exec ns030 sysctl net.ipv4.ip_forward=1
ip netns exec ns030 iptables -t nat -A POSTROUTING -o veth3031 -j MASQUERADE
ip netns exec ns030 ip route add 10.0.0.64 via 10.0.0.62
ip netns exec ns030 ip route add 10.0.0.66 via 10.0.0.62
ip netns exec ns030 ip route add 10.0.0.68 via 10.0.0.62

# ns031
ip link set veth3130 netns ns031
ip link set veth3132 netns ns031
ip netns exec ns031 ip addr add 10.0.0.62 peer 10.0.0.61 dev veth3130
ip netns exec ns031 ifconfig veth3130 up
ip netns exec ns031 ip addr add 10.0.0.63 peer 10.0.0.64 dev veth3132
ip netns exec ns031 ifconfig veth3130 up
ip netns exec ns031 sysctl net.ipv4.ip_forward=1
ip netns exec ns031 iptables -t nat -A POSTROUTING -o veth3132 -j MASQUERADE
ip netns exec ns031 ip route add 10.0.0.66 via 10.0.0.64
ip netns exec ns031 ip route add 10.0.0.68 via 10.0.0.64

# ns032
ip link set veth3231 netns ns032
ip link set veth3233 netns ns032
ip netns exec ns032 ip addr add 10.0.0.64 peer 10.0.0.63 dev veth3231
ip netns exec ns032 ifconfig veth3231 up
ip netns exec ns032 ip addr add 10.0.0.65 peer 10.0.0.66 dev veth3233
ip netns exec ns032 ifconfig veth3231 up
ip netns exec ns032 sysctl net.ipv4.ip_forward=1
ip netns exec ns032 iptables -t nat -A POSTROUTING -o veth3233 -j MASQUERADE
ip netns exec ns032 ip route add 10.0.0.68 via 10.0.0.66

# ns033
ip link set veth3332 netns ns033
ip link set veth3334 netns ns033
ip netns exec ns033 ip addr add 10.0.0.66 peer 10.0.0.65 dev veth3332
ip netns exec ns033 ifconfig veth3332 up
ip netns exec ns033 ip addr add 10.0.0.67 peer 10.0.0.68 dev veth3334
ip netns exec ns033 ifconfig veth3332 up
ip netns exec ns033 sysctl net.ipv4.ip_forward=1
ip netns exec ns033 iptables -t nat -A POSTROUTING -o veth3334 -j MASQUERADE

# ns034
ip link set veth3433 netns ns034
ip netns exec ns034 ip addr add 10.0.0.68 peer 10.0.0.67 dev veth3433
ip netns exec ns034 ifconfig veth3433 up
