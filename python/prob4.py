import sys
import re


a_re = re.compile('(A.+)||(a.+)')

with open(sys.argv[1], "r") as file:
    x=file.read()
    a = a_re.findall(x)
    print len(a)