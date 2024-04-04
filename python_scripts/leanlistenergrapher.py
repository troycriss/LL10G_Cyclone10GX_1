
import socket
import statistics
import time
import serial



def volts_plus_one(dac_00_voltage):
    dac_00_voltage += 5
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    return dac_00_voltage
    time.sleep(1)

def volts_minus_one(dac_00_voltage):
    dac_00_voltage -= 1
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    return dac_00_voltage
    time.sleep(1)

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


ser = serial.Serial('COM4', 9600)
time.sleep(3)


command = 'dacwrite 00 0600'
ser.write(command.encode())
print('dac 00 set')
time.sleep(3)
initial_dac_00 = 110
command2 = 'dacwrite 05 0800'
ser.write(command2.encode())
print('dac 05 set')
time.sleep(1)
command3 = 'dacwrite 04 0300'
ser.write(command3.encode())
print('dac 04 set')
time.sleep(1)
command4 = 'dacwrite 06 0300'
ser.write(command4.encode())
print('dac 06 set')
time.sleep(1)
command = 'dacwrite 00 0600'
ser.write(command.encode())
print('dac 00 set')
time.sleep(1)


from bitstring import BitArray

def collectNbitsToFile(n, filename):
    initial_dac_00 = 460
    npacket=0

    printEveryNPackets = 2000
    totalDataPoints = 0
    savedata = bytearray()

    sumofones = 0
    t = time.time()

    totalerrors = 0
    sumoferrors = 0
    
    voltages = []
    probabilities = []
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
            #f.write(data)
          
            if npacket % 1000 == 0:
                print('running',npacket)
            if npacket%printEveryNPackets==0:
                new_data_pts = (printEveryNPackets*len(data)*8)
                print('{} seconds and {} new data points since last message.'.format(time.time()-t, new_data_pts))
                
                print('Reset errors in that time: ', sumoferrors, ' with a ', sumoferrors/(printEveryNPackets*len(data)*8), ' chance of a reset error')
                print('Total reset errors {}'.format(totalerrors))
                totalerrors += sumoferrors
                sumoferrors = 0
                t = time.time()
                avg = (sumofones) / (printEveryNPackets*8)
                sumofones = 0
                totalDataPoints=npacket*len(data)*8
                print('Received:\n\tPacket number: {}\n\tTotal data points: {}\n\tBias of the last {} packets: {}\n'.format(npacket, totalDataPoints, printEveryNPackets, avg))#, saved_signal)
                voltages.append(initial_dac_00)
                probabilities.append(avg)
                initial_dac_00 = volts_plus_one(initial_dac_00)
                print(voltages)
                print(probabilities)
               
                if initial_dac_00 >= 560:
                    f.close()
                    metafile = open(filename[:-3] + "META.txt", "w")
                    metafile.write("Total data points: " + str(totalDataPoints))
                    metafile.write("\nTotal reset errors: " + str(totalerrors))
                    print(voltages)
                    print(probabilities)
                    return voltages, probabilities



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

time_and_amp_data = []

import subprocess

# Command to open the CLI
cli_command = 'C:\\intelFPGA_pro\\18.1\\quartus\\sopc_builder\\bin\\system-console.exe --cli'

# Commands to run in the CLI


for i in range(1, 10):
    cli_commands = [
    'cd {C:\\\\git\\\\LL10G\\\\hwtesting\\\\system_console}',
    'source main.tcl',
    'SEND 0 10G 1000000000000000',
    'PULSES_pos3dur ' + str(i)
    ]
    with subprocess.Popen(cli_command, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True, text=True) as cli_process:
            
        # Concatenate all commands into a single string
        all_commands = '\n'.join(cli_commands) + '\n'

        # Run all commands in the CLI
        cli_process.stdin.write(all_commands)
    time.sleep(6)
    time_and_amp_data.append(collectNbitsToFile(16000, 'filename.txt.'))
    time.sleep(6)


import csv
csv_file_name = "time-and-amp-output.csv"

# Writing to CSV
with open(csv_file_name, mode='w', newline='') as csv_file:
    csv_writer = csv.writer(csv_file)
    csv_writer.writerows(time_and_amp_data)

print(f"Data has been written to {csv_file_name}.")