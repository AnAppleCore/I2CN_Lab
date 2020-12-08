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
print(' -----Traversal succeed!----- ')
print('\tlport\traddr\t\t\trport')
print('\t',int(clientPort),'\t',ip_addr[0],'\t\t', int(ip_addr[1]))

# direct communication
while True:
	choice = input("Send to the other host? [Y/N]\t")
	if choice == 'Y' or choice =='y':
		data = input("Input data:\t")
		sock_c.sendto(data.encode(encoding = "utf-8"), (ip_addr[0], int(ip_addr[1])))
	elif choice == 'N' or choice =='n':
		print("Listening for packet")
		data,addr = sock_c.recvfrom(1024)
		print("Received data:\t",data.decode(encoding = "utf-8"))
		print('\t from IP: ', addr[0])
	else:
		print('Please try again ... ')