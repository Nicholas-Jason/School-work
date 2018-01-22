import sys
wordlenlist = []

for word in sys.stdin:
    word = word.rstrip()
    wordlen = len(word) - 1
    if wordlen >= len(wordlenlist):
	for x in range(wordlen - len(wordlenlist)):
	    wordlenlist.append(0)

	wordlenlist.append(1)
    else:
	wordlenlist[wordlen] = wordlenlist[wordlen] + 1

for i in range(1, len(wordlenlist)):
    print '%i: %i' % (i,wordlenlist[i])