# Lab 4 Experiment Steps (keep the 5 VMs alive along the whole porcedure):

## 1. put the code files client.py and server.py on VM h1, h2, and server, respectively. Or simply download the code files by git:

    git clone https://github.com/AnAppleCore/I2CN_lab.git

## 2. Run server.py on VM server:

    python3 server.py

## 3. Input the IP address and port of the server, following the printed info:

    Server IP: < server ip address>
    Server Port: < server port number>

## 4. Run client.py on VM hosts h1 and h2, respectively:

    python3 client.py

## 5. Input the IP address and port number of server and host on h1 and h2, respectively and almost SIMULTANEOUSLY. Following the printed texts:

    Server IP: < server ip address>
    Server Port: < server port number>
    Client IP: < host ip address in the (r, h) subnet>
    Client Port: < host port number>

## 6. Then if the following line is printed on both side of hosts, the traversal succeeds:

     -----Traversal succeed!----- 
        lport   raddr           rport
        xxxxx   xx.xx.xx.xx     xxxx

## 7. The direct communication between h1 and h2 without server starts, to valid the success of traversal
    
### (1) Decide h1 -> h2 or h2 -> h1, by typing 'Y' or 'N'


### (2) If decide to send data, then type the message data after "Input data:", else waits for the packet from the other host


### (3) upon receiveing the packet messge, the data and its source IP will be output on the screen to valid the succcess of traversal


### (4) If invalid key value is read, try again



# Lab 5 Experiment steps (keep 2 VMs alive along the whole porcedure):

Maker sure that hosts A (dns) and B (test) are connected by a host-only network and all the following steps must be executed as root. In virtual machines A and B, all the code files and scripts are included in the directory: /home/aac/I2CN_lab/ . One can simple git clone this reposiroty to the target directory. Here's a brief introduction to the files:

### img2ascii.py: 

a script to transform a image file into a acsii art file. This script comes from the blog https://blog.csdn.net/lly1122334/article/details/80625874 
One can run this script by executing:

    python3 img2ascii.py --file test.jpg --out out.txt -c --morelevels

### lab5.hosts:

specify the name for each ip address

### lab5_A.sh: 

the script to run on the hosts A, in which the chain is built up

### lab5_B.sh: 

the script to run on the hosts B, in which the traceroute command is executed

### script.py

the script to produce lab5_A.sh

### test.jpg

the test image to produce the ascii art, which has size 500x500

## dependecies:

In the vitual machines lab5-A and lab5-B, all the corresponding packages need to be installed:

### (1) install dnsmasq
### (2) install traceroute
### (3) install python3 and numpy, PIL packages

## step 1 change the dnsmasq configuration on host A:

### (1) make sure the addn-hosts is lab5.hosts by adding the following line to /etc/dnsmasq.conf

    addn-hosts=/home/aac/I2CN_lab/lab5.hosts

### (2) make sure the listen address is A's ip by adding the following line to /etc/dnsmasq.conf (10.0.1.1 is host A's ip in host-only nework)

    listen-address=127.0.0.1, 10.0.1.1

### (3) make sure the nameserver is 127.0.0.1 by changing the following line to /etc/resolv.conf

    nameserver=127.0.0.1

### (4) restart dnsmasq

    systemctl restart dnsmasq

### (5) if the port 53 is already is use, manually stop system-resolved


## step 2 traceroute on host B

### (1) make sure the nameserver is A'ip in host-only network by changing the following line to /etc/resolv.conf

    namerserver=10.0.1.1

### (2) executing the script lab5_B.sh, in which the following lines will be executed:

    traceroute 10.0.0.68 -m 34 -z 0.1
