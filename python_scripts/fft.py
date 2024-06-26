import matplotlib.pyplot as plt
import numpy as np
from numpy.fft import fft, ifft
import random
from scipy.signal import find_peaks

#read in data
bytestream = bytearray(b'')
i_byte = 0
brk = False
with open('1.31.24-10MB-sample-nist.txt', 'rb') as file:
    for line in file:
        for b in line:
            i_byte += 1
            if i_byte > 5000000:
                brk = True
                break
            bytestream.append(b)
        if brk:
            break
boolstream = []
for b in bytestream:
    for i in range(8):
        boolstream.append((b >> i) & 0b1)

#fake boolstream
#boolstream = np.random.randint(2,size=len(boolstream))
#print(boolstream[:100])

# sampling rate, number of samples per second
sr = 10.89e6 # from Andre oscilloscope
print("sr",sr)
#number of samples
ns = 500000
print("ns",ns)

# sampling period
ts = 1.0/sr
#array holding time for each sample
t = np.arange(0,ns*ts,ts)

# make fake data
#x = 0*t
#x += 1.0* (np.sin(2*np.pi*4*t)+1)
#x += 0.5* 1 * (np.sin(2*np.pi*7*t)+1)
#x[40:50]=17
#x=np.round(x)
#print(np.average(x))

#plt.plot(t, x, 'r')
#plt.xlabel('Time')
#plt.ylabel('Amplitude')
#plt.show()

x=boolstream[:ns]
X = fft(x)
for i in range(ns,len(boolstream),ns):
    print(i)
    if i+ns>len(boolstream): continue
    x=boolstream[i:i+ns]
    X = X + fft(x)

T = ns/sr
freq = np.arange(ns)/T

plt.stem(freq, np.abs(X), 'b',markerfmt=" ")
plt.xlabel('Freq (Hz)')
plt.ylabel('FFT Amplitude |X(freq)|')
plt.xlim(1, freq[-1]/2.) # ignore 0 freq (DC offset), and only go up to half the max freq, since it's symmetric
plt.ylim(0,1.05*max(np.abs(X[1:])))
#plt.ylim(.01,1.25*max(np.abs(X[1:]))); plt.yscale("log")
plt.show()

#Find peaks
peaks = find_peaks(np.abs(X), height=5000, threshold=500, distance=10)
heights = peaks[1]['peak_heights'] #list of the heights of the peaks
peakpos = freq[peaks[0]] #list of the peaks positions
print("peak heights",np.round(heights))
print("peak freqs",np.round(peakpos))

# ifftX = ifft(X)
# plt.plot(t, np.real(ifftX), 'r')
# plt.xlabel('Time (s)')
# plt.ylabel('Amplitude')
# plt.show()
#
#
# plt.plot(t, x-np.real(ifftX), 'r')
# plt.xlabel('Time (s)')
# plt.ylabel('Amplitude difference')
# plt.show()
