Experiment Steps (keep the 5 VMs alive along the whole porcedure):

    1. put the code files client.py and server.py on VM h1, h2, and server, respectively. Or simply download the code files by git:

        < git clone https://github.com/AnAppleCore/I2CN_lab.git >

    2. Run server.py on VM server:

        < python3 server.py >

    3. Input the IP address and port of the server, following the printed info:

        Server IP: < server ip address>
        Server Port: < server port number>

    4. Run client.py on VM hosts h1 and h2, respectively:

        < python3 client.py >

    5. Input the IP address and port number of server and host on h1 and h2, respectively and almost SIMULTANEOUSLY. Following the printed texts:

        Server IP: < server ip address>
        Server Port: < server port number>
        Client IP: < host ip address in the (r, h) subnet>
        Client Port: < host port number>

    6. Then if the following line is printed on both side of hosts, the traversal succeeds:

         -----Traversal succeed!----- 
            lport   raddr           rport
            xxxxx   xx.xx.xx.xx     xxxx

    7. The direct communication between h1 and h2 without server starts, to valid the success of traversal
    
        (1) Decide h1 -> h2 or h2 -> h1, by typing 'Y' or 'N'

        (2) If devide to send data, then type the message data after "Input data:"
            else waits for the packet from the other host

        (3) upon receiveing the packet messge, the data and its source IP will be output on the screen to valid the succcess of traversal

        (4) If invalid key value is read, try again