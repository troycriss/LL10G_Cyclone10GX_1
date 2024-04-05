import mmap

file_path = 'pulse_adjuter_test_3_12'

with open(file_path, 'r') as file:
    line_count = 0
    with mmap.mmap(file.fileno(), 0, access=mmap.ACCESS_READ) as mm:
        while mm.readline():
            line_count += 1

print("Total number of lines:", line_count)