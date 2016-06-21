#for i in range(0x200, 0x2a8, 4):
#    print('{0:0>14b}'.format(i))
with open('ld.hex') as file_in, open('ld.txt', 'w') as file_out:
    i = 0x0000
    for line in file_in.readlines():
        file_out.write('{0:0>16b}{1}\n'.format(i, line[:-1]))
        i += 4
    file_out.write("{0:0>16b}{1:0>32b}\n".format(100, 7))
    file_out.write("{0:0>16b}{1:0>32b}\n".format(104, 13))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2000, 9))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2004, 6))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2008, 1))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x200c, 3))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2010, 7))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2014, 5))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2018, 4))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x201c, 2))
#    file_out.write('{0:0>32b}{1:0>32b}\n'.format(0x2020, 8))
