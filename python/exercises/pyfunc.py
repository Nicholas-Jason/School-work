def factorial(n):                      # define a function
     if (n == 1):
	 return (1)
     else:
	 return (n * factorial(n-1))      # recursion

x = factorial(5)           