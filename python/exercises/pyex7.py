import sys

z = open("output.txt","w")

arg = sys.argv
def usage():
    print" There is no input file. Please add one"
    sys.exit(1)

if(len(arg) == 1):
    usage();
    exit();
else:
    with open(sys.argv[1], "r") as file:
	y = file.read()
	z.writelines(y)
	print y
sys.exit(1)





