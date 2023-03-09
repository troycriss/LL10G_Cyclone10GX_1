import socket
import sys

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_address = ("localhost", 2023)
s.bind(server_address)
print("Do Ctrl+c to exit the program !!")

while True:
    print("####### Server is listening #######")
    data, address = s.recvfrom(4096)
    print("\n\n 2. Server received: ", data.decode('utf-8'), "\n\n")
