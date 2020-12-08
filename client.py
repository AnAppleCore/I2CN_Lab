import socket

serverIP = input("Server IP: ")
serverPort = input("Server Port: ")
clientIP = input("Client IP: ")
clientPort = input("Client Port: ")

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # socket with server
sock_c = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # socket with remote client

sock_c.bind((clientIP, int(clientPort)))

# send to server from the client port 
sock.sendto(clientPort.encode(encoding = "utf-8"), (serverIP, int(serverPort)))

# receive remote client's (IP, Port)
data,addr = sock.recvfrom(1024)
ip_addr = data.decode(encoding = "utf-8").split(',')

# ACK communication
sock_c.sendto(b"ACK", (ip_addr[0], int(ip_addr[1])))
data,addr = sock_c.recvfrom(1024)

# NAT traversal succeed 
print("---- (lport: %d, raddr: %s, rport: %d) ----"%(int(clientPort),ip_addr[0],int(ip_addr[1])))

# direct communication
while True:
	choice = input("To send(0) or to listen(1)? : ")
	try:
		choice=int(choice)
		if choice == 0:
			msg = input("Input message:")
			sock_c.sendto(msg.encode(encoding = "utf-8"), (ip_addr[0], int(ip_addr[1])))
		elif choice == 1:
			print("Listening...")
			data,addr = sock_c.recvfrom(1024)
			print("Get message [",data.decode(encoding = "utf-8"),"] from addr ", addr[0])
		else:
			print("Invalid, input 0 or 1")
	except:
		print("Invalid, input 0 or 1")