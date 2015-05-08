#!/usr/bin/env python2.7


def factor(n):
    d = 2
    factors =  [ ]
    while n >  1:
        if n % d == 0:
	    factors.append(d)
	    n = n / d
        else:
	    d = d + 1
    return factors


print factor(1234)
