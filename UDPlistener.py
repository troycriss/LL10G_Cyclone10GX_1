import socket
SEND_BUF_SIZE = 65536*1000
RECV_BUF_SIZE = 65536*1000
def modify_buff_size(sock):
    bufsize = sock.getsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF)
    print("Send buffer size [Before]:%d" % bufsize)
    bufsize = sock.getsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF)
    print("Recv buffer size [Before]:%d" % bufsize)
    #sock.setsockopt(socket.SOL_TCP,socket.TCP_NODELAY, 1)
    sock.setsockopt(
        socket.SOL_SOCKET,
        socket.SO_SNDBUF,
        SEND_BUF_SIZE)
    sock.setsockopt(
        socket.SOL_SOCKET,
        socket.SO_RCVBUF,
        RECV_BUF_SIZE)
    bufsize = sock.getsockopt(socket.SOL_SOCKET, socket.SO_SNDBUF)
    print("Send buffer size [After]:%d" % bufsize)
    bufsize = sock.getsockopt(socket.SOL_SOCKET, socket.SO_RCVBUF)
    print("Recv buffer size [After]:%d" % bufsize)

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
modify_buff_size(s)
server_address = ("", 2023)
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
