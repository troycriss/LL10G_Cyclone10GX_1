import matplotlib.pyplot as plt
import numpy as np
from numpy.fft import fft, ifft, rfft, irfft
from matplotlib import colors
from matplotlib.ticker import PercentFormatter
from scipy.stats import norm

import statistics

f = open("long-experiment.txt", "r")
#export_file = open("switches.txt", "w")

indices = list(range(0, 10000))
times = [x * 0.000304 for x in indices]
ones = []

last_selection = 0
for seg in range(0, 10000):
    f.seek(seg*1000)
    selection = f.read(1000)
    onecount = 0
    for i in range(0, 1000):
        is_one = 0
        if int(selection[i]) == 1:
            is_one = 1
        last_selection = int(selection[i])
        onecount += is_one
    ones.append(onecount)
    
#export_file.write(str(switches))

# SCATTERPLOT

# line1 = plt.plot(times, ones,'-,m', label='Edges')
# plt.xlabel("Freq")
# plt.ylabel("FFT")

# line2 = plt.plot([0,times[9999]],[500,500], 'b-', label='Expected Mean (500)')


window = 100
average_y = []
for ind in range(len(ones) - window + 1):
    average_y.append(np.mean(ones[ind:ind+window]))


# line4 = plt.plot(times[:9901], average_y, '-,c', label='Rolling Average')
# plt.legend()
# plt.show()


plt.figure(figsize = (10,4))
plt.subplot(1,2,1)
plt.plot(average_y)
plt.subplot(1,2,2)   
t = np.array(average_y)

    

sp = np.fft.fft(average_y-np.mean(average_y))
freq = np.fft.fftfreq(t.shape[-1])
plt.plot(freq, sp.real, freq, sp.imag)
plt.show()



"""
plt.figure(1)


# sampling rate
sr = 1000
# sampling interval
ts = 1.0/sr
t = np.arange(0,1,ts)

freq = 1.

X = fft(ones)
N = len(X)
n = np.arange(N)
T = N/1000
freq = n/T 

plt.figure(figsize = (12, 6))
plt.subplot(121)

plt.stem(freq, np.abs(X), 'b', \
         markerfmt=" ", basefmt="-b")
plt.xlabel('Freq (Hz)')
plt.ylabel('FFT Amplitude |X(freq)|')
plt.xlim(0, 10)

plt.subplot(122)
plt.plot(t, ifft(X), 'r')
plt.xlabel('Time (s)')
plt.ylabel('Amplitude')
plt.tight_layout()
plt.show()
"""

"""

# HISTOGRAM
fig, axs = plt.subplots(1)
axs.hist(ones, bins=int((max(ones)-min(ones))/1))

mean=np.mean(ones)
variance=np.var(ones)
sigma=np.sqrt(variance)
x = np.linspace(min(ones), max(ones), 100)
plt.plot(x, norm.pdf(x,mean,sigma)*10000)

plt.xlabel("Number of high bits (i.e., AP -> P transitions) in 1000 consecutive measurements")
plt.ylabel("Frequency")
plt.show
"""