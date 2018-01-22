#pyex6.py: word lengths using dictionary

import sys

lengths = {} #start w/ empty dictionary

for word in sys.stdin:
	wordlen = len(word) - 1
	
	if lengths.has_key(wordlen):
		lengths[wordlen] += 1
	else:
		lengths[wordlen] = 1

for i in lengths.keys():
	print '%i: %i' % (i, lengths[i])
