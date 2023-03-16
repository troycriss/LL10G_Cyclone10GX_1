import socket

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server_address = ("192.168.10.11", 2023)
s.bind(server_address)
print("Ctrl+c to exit the program!")
npacket=0
while True:
    data, address = s.recvfrom(1520)
    npacket=npacket+1
    if npacket%100==0: print("Got packet", npacket)
    seq_num=data[:2] # sequence id of packet sent
    packet_tx_count=data[2:4] # number of packets sent
    fifo_rdusedw=data[4:6] # fifo used length at time of sending
    print(repr(address), int.from_bytes(seq_num,"big"), int.from_bytes(packet_tx_count,"big"), int.from_bytes(fifo_rdusedw,"big"))
    data=data[6:]
    print(len(data),"bytes:", ' '.join('{:02x}'.format(b) for b in data))
