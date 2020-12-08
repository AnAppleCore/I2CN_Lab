import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

serverIP = input("Server IP: ")
serverPort = input("Server Port: ")

sock.bind((serverIP, int(serverPort)))

while True:
	cnt = 0
	addrList = []
	dataList = []
	while cnt < 2:
		# the server will only grab two packets from each side and then transfer them
		# wether a traversal succeed or not, stop
		data,addr = sock.recvfrom(1024)
		data = addr[0]+','+data.decode(encoding = "utf-8")
		addrList.append(addr)
		dataList.append(data)
		cnt += 1

	sock.sendto(dataList[1].encode(encoding = "utf-8"), addrList[0])
	sock.sendto(dataList[0].encode(encoding = "utf-8"), addrList[1])