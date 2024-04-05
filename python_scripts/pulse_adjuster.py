"""
import serial
import time
import socket
import statistics
import time


# Replace 'COM3' with your Arduino's port and 9600 with the correct baud rate
ser = serial.Serial('COM4', 9600)




def volts_plus_one(dac_00_voltage):
    dac_00_voltage += 1
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    return dac_00_voltage
    time.sleep(1)

def volt_minus_one(dac_00_voltage):
    dac_00_voltage -= 1
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    return dac_00_voltage
    time.sleep(1)

ser = serial.Serial('COM4', 9600)
command = 'dacwrite 00 0661'
ser.write(command.encode())
print('dac 00 set')
time.sleep(3)
initial_dac_00 = 661
command2 = 'dacwrite 05 0750'
ser.write(command2.encode())
print('dac 05 set')
time.sleep(3)
command3 = 'dacwrite 04 0300'
ser.write(command3.encode())
print('dac 04 set')
time.sleep(3)
command4 = 'dacwrite 06 0300'
ser.write(command4.encode())
print('dac 06 set')
time.sleep(3)
command = 'dacwrite 00 661'
ser.write(command.encode())
print('dac 00 set')
time.sleep(3)



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

    printEveryNPackets = 100_000
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
            check = True
            while check == True:
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
            #check probability and adjust
                if avg > 51 or avg < 49 or check == False:
                    print('probability off center, adjusting voltage')
                    check = False
                    if avg > 50.75:
                        initial_dac_00 = volts_minus_1(initial_dac_00)
                    elif avg < 49.25:
                        initial_dac_00 = voltage_plus_1(initial_dac_00)
                    else:
                        check = True
                    
                    
                    
                    
                    



filename_trash = "TRASHDATA.txt"

mbslow = 'megabyte-slow.txt'

filename9A = 'COLLECTING-1e9-bits-A.txt'
filename9B = 'COLLECTING-1e9-bits-B.txt'
filename9C = 'COLLECTING-1e9-bits-C.txt'

filename10A = 'COLLECTING-1e10-bits-A.txt'
filename10B = 'COLLECTING-1e10-bits-B.txt'
filename10C = 'COLLECTING-1e10-bits-C.txt'




collectNbitsToFile(1_000_000_000_000, "Pulse adjustment test one")

"""



import socket
import statistics
import time
import serial

ser = serial.Serial('COM4', 9600)
command = 'dacwrite 00 0563'
ser.write(command.encode())
print('dac 00 set')
time.sleep(3)
initial_dac_00 = 110
command2 = 'dacwrite 05 0750'
ser.write(command2.encode())
print('dac 05 set')
time.sleep(3)
command3 = 'dacwrite 04 0300'
ser.write(command3.encode())
print('dac 04 set')
time.sleep(3)
command4 = 'dacwrite 06 0300'
ser.write(command4.encode())
print('dac 06 set')
time.sleep(3)
command = 'dacwrite 00 0563'
ser.write(command.encode())
print('dac 00 set')
time.sleep(3)


def volts_plus_one(dac_00_voltage):
    dac_00_voltage += 1
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    
    time.sleep(1)
    return dac_00_voltage
    

def volts_minus_one(dac_00_voltage):
    dac_00_voltage -= 1
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    
    time.sleep(1)
    return dac_00_voltage

def proportion_contol(errors_list,proporitonal_gain):
    adjustment = errors_list[-1]* proporitonal_gain
    return adjustment
     
##time constraint is the amount of time to sum over, if set to 0, sum over all time
## easiet way -- time_constrain is input not as a amount of real time, but a number of recorded times to sum over
## if time constraint = 100, sum over the last 100 errors, since all errors are recorded at about the same time it should still be fine
def integral_control(errors_list, time_constraint, integral_gain):
    error_sum = 0
    if time_constraint == 0 or len(errors_list) < time_constraint:
        error_sum = sum(errors_list)
    else:
        error_sum = sum(errors_list[-time_constraint:])
    adjustment = integral_gain * error_sum
    return adjustment


def derivative_control(errors_list, derivative_gain):
    d_error = errors_list[-1] - errors_list[-2]
    adjustment = d_error * derivative_gain
    return adjustment

def pid_controll(errors_list,time_constrain,proportional_gain, integral_gain, derivative_gain):
    proportion = proportion_contol(errors_list, proportional_gain)
    integral = integral_control(errors_list, time_constrain,integral_gain)
    derivative = derivative_control(errors_list, derivative_gain)
    adjustment = round(abs(proportion + derivative + integral))
    if adjustment == 0:
        adjustment = 1
    return adjustment

def PID_adjuster_high(errors_list,time_constrain,proportional_gain, integral_gain, derivative_gain, dac_00_voltage):
    adjustment = pid_controll(errors_list,time_constrain,proportional_gain, integral_gain, derivative_gain)
    dac_00_voltage += adjustment
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    
    time.sleep(1)
    return dac_00_voltage

def PID_adjuster_low(errors_list,time_constrain,proportional_gain, integral_gain, derivative_gain, dac_00_voltage):
    adjustment = pid_controll(errors_list,time_constrain,proportional_gain, integral_gain, derivative_gain)
    dac_00_voltage -= adjustment
    command_new = f'dacwrite 00 {dac_00_voltage}'
    ser.write(command_new.encode())
    
    time.sleep(1)
    return dac_00_voltage



    
    
    
    

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









def collectNbitsToFile(n, filename):
    dac_00 = 563
    averages = []
    times = []
    voltages = []
    errors = []
    start_time = time.time()
    npacket=0

    ##PID controls 
    P_gain = 0.3
    I_gain = 0.1
    D_gain = 0.2
    time_constrain = 25

    printEveryNPackets = 100000
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
           
            check = 0
            
            f.write(data)
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
                avg = sumofones / (printEveryNPackets*8)
                sumofones = 0
                totalDataPoints=npacket*len(data)*8
                print('Received:\n\tPacket number: {}\n\tTotal data points: {}\n\tBias of the last {} packets: {}\n'.format(npacket, totalDataPoints, printEveryNPackets, avg))#, saved_signal)
                if avg > 0.51 or avg < 0.49:
                    error = 50 - (avg*100)
                    errors.append(error)
                    elapsed_time = time.time() - start_time
                    averages.append(avg)
                    times.append(elapsed_time)
                    voltages.append(dac_00)
                    if avg>0.51:
                        dac_00 = PID_adjuster_high(errors, time_constrain, P_gain, I_gain, D_gain, dac_00)
                    elif avg < 0.51:
                        dac_00 = PID_adjuster_low(errors, time_constrain, P_gain, I_gain, D_gain, dac_00)
                if avg < 0.51 and avg > 0.49:
                    error = 50 - (avg*100)
                    errors.append(error)
                    elapsed_time = time.time() - start_time
                    averages.append(avg)
                    times.append(elapsed_time)
                    voltages.append(dac_00)
                    print(averages)
                    print(times)
                    print(voltages)
                
                if totalDataPoints >= n:
                    f.close()
                    metafile = open(filename[:-3] + "META.txt", "w")
                    metafile.write("Total data points: " + str(totalDataPoints))
                    metafile.write("\nTotal reset errors: " + str(totalerrors))
                    return averages, times



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

collectNbitsToFile(1_000_000_000_000, "pulse_adjuter_test_3_23")






