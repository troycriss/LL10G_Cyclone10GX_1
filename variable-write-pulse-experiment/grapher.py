import matplotlib.pyplot as plt
import statistics

f = open("long-experiment.txt", "r")
#export_file = open("switches.txt", "w")

indices = list(range(0, 10000))
times = [x * 0.304 for x in indices]
switches = []

last_selection = 0
for seg in range(0, 10000):
    f.seek(seg*1000)
    selection = f.read(1000)
    switchcount = 0
    for i in range(0, 1000):
        switch = 0
        if last_selection == selection[i]:
            switch = 1
        last_selection = selection[i]
        switchcount += switch
    switches.append(switchcount)
    print(seg/100, '% finished')
    
#export_file.write(str(switches))

line1 = plt.plot(times, switches,'.r', label='Switches')
plt.xlabel("Time (μs)")
plt.ylabel("Number of edges (L to H or H to L) in 1000 bit segment of bitstream")

line2 = plt.plot([0,times[9999]],[500,500], 'b-', label='Expected Mean')

avg = statistics.mean(switches)
print("Average number of switches: ", avg)

line3 = plt.plot([0,times[9999]],[avg,avg], 'g-', label='Actual Mean (493.4798)')

plt.legend(['Switches', 'Expected Mean', 'Actual Mean (493.4798)'])

plt.show()