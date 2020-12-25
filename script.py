import sys

with open('draft.sh', 'w') as f:
    # del and add the namespaces
    for i in range(34):
        f.write('ip netns del ns0'+str(i+1)+'\n')
        f.write('ip netns add ns0'+str(i+1)+'\n')
    f.write('\n')

    # add veth
    for i in range(34):
        f.write('ip link add veth'+str(i)+str(i+1)+' type veth peer name veth'+str(i+1)+str(i)+'\n')
    f.write('\n')

    # in the default namespace
    f.write('# default ns\n')
    f.write('ip addr add 10.0.0.1 peer 10.0.0.2 dev veth01\n')
    f.write('ifconfig veth01 up\n')
    for i in range(33):
        f.write('ip route add 10.0.0.'+str(2*i+4)+' via 10.0.0.2\n')
    f.write('\n')

    # within each namespace except the default namespace
    for i in range(33):
        j = i + 1
        f.write('# ns0'+str(j)+'\n')
        f.write('ip link set veth'+str(j)+str(i)+' netns ns0'+str(j)+'\n')
        f.write('ip link set veth'+str(j)+str(j+1)+' netns ns0'+str(j)+'\n')

        f.write('ip netns exec ns0'+str(j)+' ip addr add 10.0.0.'+str(2*j)+' peer 10.0.0.'+str(2*j-1)+' dev veth'+str(j)+str(i)+'\n')
        f.write('ip netns exec ns0'+str(j)+' ifconfig veth'+str(j)+str(i)+' up\n')
        f.write('ip netns exec ns0'+str(j)+' ip addr add 10.0.0.'+str(2*j+1)+' peer 10.0.0.'+str(2*j+2)+' dev veth'+str(j)+str(j+1)+'\n')
        f.write('ip netns exec ns0'+str(j)+' ifconfig veth'+str(j)+str(j+1)+' up\n')

        f.write('ip netns exec ns0'+str(j)+' sysctl net.ipv4.ip_forward=1\n')
        f.write('ip netns exec ns0'+str(j)+' iptables -t nat -A POSTROUTING -o veth'+str(j)+str(j+1)+' -j MASQUERADE\n')

        for k in range(34-j-1):
            f.write('ip netns exec ns0'+str(j)+' ip route add 10.0.0.'+str(2*j+2*k+4)+' via 10.0.0.'+str(2*j+2)+'\n')
        f.write('\n')

    # in the last namespace
    f.write('# ns034\n')
    f.write('ip link set veth3433 netns ns034\n')
    f.write('ip netns exec ns034 ip addr add 10.0.0.68 peer 10.0.0.67 dev veth3433\n')
    f.write('ip netns exec ns034 ifconfig veth3433 up\n')