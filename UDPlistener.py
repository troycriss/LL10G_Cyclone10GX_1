import socket

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_address = ("192.168.10.11", 2023)
s.bind(server_address)
print("Ctrl+c to exit the program!")
npacket=1
while True:
    data, address = s.recvfrom(2000)
    if npacket%100==0: print("Got packet", npacket) #, "Data", data, "\n")
    npacket=npacket+1
