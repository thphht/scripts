/* recursive Fibonacci */ 



#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])

{

  printf("%d\n", fib(atoi(argv[1])) );

  return 0;
}



int fib(int n) 
{
  if (n < 2)
    return n;
      else
	   return fib(n-1) + fib(n-2);
}
