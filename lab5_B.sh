################################################################
################### host-only network setting ##################
ip addr add 10.0.1.2/24 dev enp0s8
ifconfig enp0s8 up
ip route add default via 10.0.1.1

################################################################
############### store and load dnsmasq settings ################
cp /etc/resolv.conf /home/aac/I2CN_lab/resolv.conf

cp /home/aac/I2CN_lab/lab5_resolv_B.conf /etc/resolv.conf

################################################################
############################# test #############################
traceroute 10.0.0.68 -m 34 -z 0.1