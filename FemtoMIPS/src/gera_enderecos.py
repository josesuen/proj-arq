with open('swap.bin') as file_in, open('swap.txt', 'w') as file_out:
    i = 0x0000
    for line in file_in.readlines():
        file_out.write('{0:0>16b}{1}\n'.format(i, line[:-1]))
        i += 4
##with open('data.txt', 'w') as file_out:
##    file_out.write("{0:0>16b}{1:0>32b}\n".format(0x0000, 0x7))
##    file_out.write("{0:0>16b}{1:0>32b}\n".format(0x0004, 0x6))
##    file_out.write("{0:0>16b}{1:0>32b}\n".format(0x0008, 0x5))
##    file_out.write("{0:0>16b}{1:0>32b}\n".format(0x000C, 0x4))
##    file_out.write("{0:0>16b}{1:0>32b}\n".format(0x0010, 0x3))

##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1000, 9))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1004, 6))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1008, 1))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x100c, 3))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1010, 7))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1014, 5))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1018, 4))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x101c, 2))
##        file_out.write('{0:0>16b}{1:0>32b}\n'.format(0x1020, 8))

