import sys
import re

input = sys.stdin.read()

class_re = re.compile('<td>CS-([1-4].+)</td>')

c = class_re.findall(input)

for line in c:
   print line
