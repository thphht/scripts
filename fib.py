#!/usr/bin/env python2.7

# various ways to print out Fibonacci sequence
# F(n) = F(n-1) + F(n-2)



a,b = 0,1

print(b)
while b < 100:
    a,b = b,(a+b)
    print(b, end = " ")
