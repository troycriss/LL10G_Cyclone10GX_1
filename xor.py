f = open('data2_xor_double.txt', 'r+')
f_xor = open('data2_xor_triple.txt', 'w')

for i in range(2000):
    line = f.readline(i)
    print(line)
    line_xor = ''
    for (bit1, bit2) in zip(line[0::2], line[1::2]):
        line_xor += str(int(bool(bit1=='1') != bool(bit2=='1')))
    print(line_xor, "\n")
    f_xor.write(line_xor)