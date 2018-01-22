import sys
import re

roster = []
for line in sys.stdin:
    last, first, sid= line.split(",")
    x= first + " " + last + " " +sid
    roster.append(x)
    roster.sort()

for student in roster:
    print student
