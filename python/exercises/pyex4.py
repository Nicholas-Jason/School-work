import sys
print "Enter a word:"

for line in sys.stdin:
    line.rstrip()
    print "Length of word  is " + str(len(line))