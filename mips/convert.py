hex_numbers = """
20101234
00108400
02058020
0153482a
11200003
01378804
0327a825
08100003
01a69022
"""

lines = hex_numbers.strip().split('\n')
scale = 16 ## equals to hexadecimal

num_of_bits = 8


for line in lines:
    hex_number = line.strip()
    print(bin(int(hex_number, scale))[2:].zfill(32))
