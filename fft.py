import matplotlib.pyplot as plt
import numpy as np

# sampling rate, number of samples per second
sr = 100
#number of samples
ns = 1000

# sampling period
ts = 1.0/sr
#array holding time for each sample
t = np.arange(0,ns*ts,ts)

# make fake data
x = 0*t
#x += 1.0* (np.sin(2*np.pi*4*t)+1)
x += 0.5* 1 * (np.sin(2*np.pi*7*t)+1)
x=np.round(x)

#x[40:50]=17
#print(np.average(x))

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
plt.ylim(.01,1.25*max(np.abs(X[1:])))
plt.yscale("log")
plt.show()


ifftX = ifft(X)
plt.plot(t, np.real(ifftX), 'r')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.show()


plt.plot(t, x-np.real(ifftX), 'r')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude difference')
plt.show()

