#!/usr/bin/env python2.7

def factorial(n):
    if n == 0:
      return 1
    else:
        return n*factorial(n-1) 


j = 11

print factorial(j)

