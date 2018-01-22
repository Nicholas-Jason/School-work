import sys
import re

x = re.compile('([A-Z].+)')
input = sys.stdin.read()

y = x.findall(input)

for line in y:
    print line
