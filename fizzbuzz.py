

def fizzorbuzz(maxfizz):
    
    
    for j in range(1,maxfizz):
        
        if ( j % 3) == 0 and (j % 5) == 0:
            print "fizzbuzz"
        elif  (j % 3 ) == 0:
            print ("fizz")
        elif (j % 5 ) == 0:
            print "buzz"
        else:
            print j
    return



## main 

maxfizz = 16

fizzorbuzz(maxfizz)