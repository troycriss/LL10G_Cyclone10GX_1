#Set 10G ethernet card (manually in OS) to have an ip address of 192.168.10.11, subnet mask 255.255.255.0

import socket
import statistics
import time

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







from bitstring import BitArray

def collectNbitsToFile(n, filename):

    npacket=0

    printEveryNPackets = 1000
    totalDataPoints = 0
    savedata = bytearray()

    sumofones = 0
    t = time.time()

    totalerrors = 0
    sumoferrors = 0
    
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    modify_buff_size(s)
    server_address = ("", 2023)
    s.bind(server_address)
    print("Ctrl+c to exit the program!")
    
    f = open(filename, "wb")
    while True:
        data, address = s.recvfrom(1520)
        npacket=npacket+1
        if True:
            seq_num=data[:2] # sequence id of packet sent
            packet_tx_count=data[2:4] # number of packets sent
            fifo_rdusedw=data[4:6] # fifo used length at time of sending
            sumoferrors += int.from_bytes(fifo_rdusedw)
            #print(repr(address), int.from_bytes(seq_num,"big"), int.from_bytes(packet_tx_count,"big"), int.from_bytes(fifo_rdusedw,"big"))
            data=data[6:]
            
            
            sumofones += data[7] & 1
            sumofones += data[7] >> 1 & 1
            sumofones += data[7] >> 2 & 1
            sumofones += data[7] >> 3 & 1
            sumofones += data[7] >> 4 & 1
            sumofones += data[7] >> 5 & 1
            sumofones += data[7] >> 6 & 1
            sumofones += data[7] >> 7 & 1
            f.write(data)
            if npacket%printEveryNPackets==0:
                new_data_pts = (printEveryNPackets*len(data)*8)
                print('{} seconds and {} new data points since last message.'.format(time.time()-t, new_data_pts))
                
                print('Reset errors in that time: ', sumoferrors, ' with a ', sumoferrors/(printEveryNPackets*len(data)*8), ' chance of a reset error')
                print('Total reset errors {}'.format(totalerrors))
                totalerrors += sumoferrors
                sumoferrors = 0
                t = time.time()
                avg = sumofones / (printEveryNPackets*8)
                sumofones = 0
                totalDataPoints=npacket*len(data)*8
                print('Received:\n\tPacket number: {}\n\tTotal data points: {}\n\tBias of the last {} packets: {}\n'.format(npacket, totalDataPoints, printEveryNPackets, avg))#, saved_signal)
                if totalDataPoints >= n:
                    f.close()
                    metafile = open(filename[:-3] + "META.txt", "w")
                    metafile.write("Total data points: " + str(totalDataPoints))
                    metafile.write("\nTotal reset errors: " + str(totalerrors))
                    return



filename_trash = "TRASHDATA.txt"

mbslow = 'megabyte-slow.txt'

filename9A = 'COLLECTING-1e9-bits-A.txt'
filename9B = 'COLLECTING-1e9-bits-B.txt'
filename9C = 'COLLECTING-1e9-bits-C.txt'

filename10A = 'COLLECTING-1e10-bits-A.txt'
filename10B = 'COLLECTING-1e10-bits-B.txt'
filename10C = 'COLLECTING-1e10-bits-C.txt'


#collectNbitsToFile(1_000_000_000, filename9A)
#collectNbitsToFile(1_000_000_000, filename9B)
#collectNbitsToFile(1_000_000_000, filename9C)

#collectNbitsToFile(10_000_000_000, filename10A)
#collectNbitsToFile(10_000_000_000, filename10B)
#collectNbitsToFile(10_000_000_000, filename10C)

collectNbitsToFile(1e9, "xor-question-mark.txt")
