#Set 10G ethernet card (manually in OS) to have an ip address of 192.168.10.11, subnet mask 255.255.255.0

import socket
import statistics
import struct
from bitarray import bitarray

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
trigger_signal_offset=8*4

saved_signal = bitarray()  # List to store selected signal bits

def oddBits(x):
    y = (x & 0x5555555555555555)
    return y
    
def evenBits(x):
    return oddBits(x >> 1)

f = open("data4.txt", "a")
printEveryNPackets = 10000
totalDataPoints = 0
while True:
    data, address = s.recvfrom(1520)
    npacket=npacket+1
    if True:#npacket%10==0:
        #print("Got packet", npacket)
        #print(type(data))
        seq_num=data[:2] # sequence id of packet sent
        packet_tx_count=data[2:4] # number of packets sent
        fifo_rdusedw=data[4:6] # fifo used length at time of sending
        #print(repr(address), int.from_bytes(seq_num,"big"), int.from_bytes(packet_tx_count,"big"), int.from_bytes(fifo_rdusedw,"big"))
        data=data[6:]
        
        words = struct.unpack('Q'*int(len(data)/8), data)
        #print(words, '\n')
        
        old_trigger = 0
        for word in words:
            
            old_trigger = old_trigger >> 36
            if old_trigger != 0:
                bit = (old_trigger & evenBits(word)) >> (old_trigger.bit_length()-1)
                saved_signal.append(bit)
                
            old_trigger = oddBits(word)
            #print(bin(oddBits(word)), ": ", bin(evenBits(word)))
        
        if npacket%printEveryNPackets==0:
            f.write(saved_signal.to01())
            totalDataPoints+=len(saved_signal)
            #print('Received {} packets'.format(printEveryNPackets))
            print('Received:\n\tPacket number: {}\n\tTotal data points: {}\n\tBias of the last {} packets: {}\n'.format(npacket, totalDataPoints, printEveryNPackets, statistics.mean(saved_signal)))#, saved_signal)
            #print(saved_signal)
            saved_signal = bitarray()  # List to store selected signal bits