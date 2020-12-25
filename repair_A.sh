cp /home/aac/I2CN_lab/dnsmasq.conf /etc/dnsmasq.conf
cp /home/aac/I2CN_lab/resolv_A.conf /etc/resolv.conf
cp /home/aac/I2CN_lab/hosts /etc/hosts

systemctl restart dnsmasq