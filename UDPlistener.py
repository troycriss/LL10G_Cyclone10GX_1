#Set 10G ethernet card (manually in OS) to have an ip address of 192.168.10.11, subnet mask 255.255.255.0

import socket
import statistics
import struct

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

saved_signal = [0]  # List to store selected signal bits

def IK_RemoveOddBits(x):

    x = ((x & 0x44444444) >> 1) | ((x & 0x11111111) >> 0);
    x = ((x & 0x30303030) >> 2) | ((x & 0x03030303) >> 0);
    x = ((x & 0x0F000F00) >> 4) | ((x & 0x000F000F) >> 0);
    x = ((x & 0x00FF0000) >> 8) | ((x & 0x000000FF) >> 0);

    return x;


def IK_RemoveEvenBits(x):
    return IK_RemoveOddBits(x >> 1);

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
        
        j=0  
        trigger_counter=-1
        words = struct.unpack('Q'*int(len(data)/8), data)
        
        old_trigger = 1
        for word in words:
            bit = 0
            if old_trigger == 0:
                continue
            else:
                bit = (old_trigger & IK_RemoveEvenBits(word)) >> (old_trigger.bit_length()-1)
            saved_signal.append(bit)
            #print(old_trigger, ": ", bit)
            old_trigger = IK_RemoveOddBits(word)
        
        
        if npacket%10000==0:
            print(npacket, statistics.mean(saved_signal))
            saved_signal = [0]  # List to store selected signal bits

        #print('Selected Signal bits:')
        #print(' '.join('{:2b}'.format(b) for b in saved_signal))
        