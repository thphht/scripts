#
# Write three functions that compute the sum of the numbers in a given list
# using a for-loop, a while-loop, and recursion.
#

## from math import sqrt


def method1(numberlist):
    total = 0
    
    for j in numberlist:
        total = total + j
    return total


def method2(numberlist):
    total = 0   
    i = len(numberlist)
    j = 0
    while ( numberlist != '\n' ):
        total = total + 
        j += 1
    return




## main


numberlist = [7, 3, 19, 79]

print method1(numberlist)

print method2(numberlist)