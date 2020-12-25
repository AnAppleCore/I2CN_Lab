################################################################
################### host-only network setting ##################
ip addr add 10.0.1.2/24 dev enp0s8
ifconfig enp0s8 up
ip route add 10.0.0.2 via 10.0.1.1
ip route add 10.0.0.4 via 10.0.1.1
ip route add 10.0.0.6 via 10.0.1.1
ip route add 10.0.0.8 via 10.0.1.1
ip route add 10.0.0.10 via 10.0.1.1
ip route add 10.0.0.12 via 10.0.1.1
ip route add 10.0.0.14 via 10.0.1.1
ip route add 10.0.0.16 via 10.0.1.1
ip route add 10.0.0.18 via 10.0.1.1
ip route add 10.0.0.20 via 10.0.1.1
ip route add 10.0.0.22 via 10.0.1.1
ip route add 10.0.0.24 via 10.0.1.1
ip route add 10.0.0.26 via 10.0.1.1
ip route add 10.0.0.28 via 10.0.1.1
ip route add 10.0.0.30 via 10.0.1.1
ip route add 10.0.0.32 via 10.0.1.1
ip route add 10.0.0.34 via 10.0.1.1
ip route add 10.0.0.36 via 10.0.1.1
ip route add 10.0.0.38 via 10.0.1.1
ip route add 10.0.0.40 via 10.0.1.1
ip route add 10.0.0.42 via 10.0.1.1
ip route add 10.0.0.44 via 10.0.1.1
ip route add 10.0.0.46 via 10.0.1.1
ip route add 10.0.0.48 via 10.0.1.1
ip route add 10.0.0.50 via 10.0.1.1
ip route add 10.0.0.52 via 10.0.1.1
ip route add 10.0.0.54 via 10.0.1.1
ip route add 10.0.0.56 via 10.0.1.1
ip route add 10.0.0.58 via 10.0.1.1
ip route add 10.0.0.60 via 10.0.1.1
ip route add 10.0.0.62 via 10.0.1.1
ip route add 10.0.0.64 via 10.0.1.1
ip route add 10.0.0.66 via 10.0.1.1
ip route add 10.0.0.68 via 10.0.1.1

################################################################
############### store and load dnsmasq settings ################
cp /etc/resolv.conf /home/aac/I2CN_lab/resolv_B.conf

cp /home/aac/I2CN_lab/lab5_resolv_B.conf /etc/resolv.conf

################################################################
############################# test #############################
traceroute 10.0.0.68 -m 36 -z 0.1

################################################################
################ restore and  dnsmasq settings #################
cp /home/aac/I2CN_lab/resolv_B.conf /etc/resolv.conf