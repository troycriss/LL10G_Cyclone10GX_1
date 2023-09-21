import matplotlib.pyplot as plt
import numpy as np

#read in data
bytestream = bytearray(b'')
with open('megabyte.txt', 'rb') as file:
    for line in file:
        for b in line:
            bytestream.append(b)
boolstream = []
for b in bytestream:
    for i in range(8):
        boolstream.append((b >> i) & 0b1)
boolstream=boolstream[200000:300000]
print(boolstream[:100])

# sampling rate, number of samples per second
sr = 1/303e-9
print("sr",sr)
#number of samples
ns = len(boolstream)
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
# #x=np.round(x)
#print(np.average(x))

x=boolstream

plt.plot(t, x, 'r')
plt.xlabel('Time')
plt.ylabel('Amplitude')
plt.show()


from numpy.fft import fft, ifft
X = fft(x)
T = ns/sr
freq = np.arange(ns)/T

plt.stem(freq, np.abs(X), 'b',markerfmt=" ")
plt.xlabel('Freq (Hz)')
plt.ylabel('FFT Amplitude |X(freq)|')
plt.xlim(1, freq[-1]/2.) # ignore 0 freq (DC offset), and only go up to half the max freq, since it's symmetric
plt.ylim(0,1.05*max(np.abs(X[1:])))
#plt.ylim(.01,1.25*max(np.abs(X[1:]))); plt.yscale("log")
print(  freq[np.where( np.abs(X[1:])==max(np.abs(X[1:int(ns/2)])) )[0]]  )
plt.show()

exit()

ifftX = ifft(X)
plt.plot(t, np.real(ifftX), 'r')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.show()


plt.plot(t, x-np.real(ifftX), 'r')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude difference')
plt.show()

