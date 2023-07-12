f = open(data2.txt, "a+")
f_xor = open(data2_xor.txt, "w")

for i in range(2000):
	line = f.readline(i)
	line_xor = ''
	for (bit1, bit2) in zip(line[0::2], line[1::2]):
		line_xor += char(bool(bit1) & bool(bit2))
	f_xor.write(
		