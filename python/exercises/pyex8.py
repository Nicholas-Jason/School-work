#pyex8.py

import re

import os

fortunes = []

for x in range(10):
	output = os.popen('fortune -n80 -s').read()
	output = re.sub('\n', '', output)
	fortunes.append(output)
	
for each in range(10):
	print "#%i. %s" % (each, fortunes[each])
