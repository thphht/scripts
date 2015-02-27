#include <stdio.h>
#include <stdlib.h>


long factorial(long n)
{
	if (n==0)
		return (1);
	else
		return (n*factorial(n-1));
}


double sum_series(long j)
{
 	return (1/factorial(j));
	j++;
}





int main(int argc, char** argv)
{
	int k = atoi(argv[1]); 

	printf("%lf\n", sum_series(k));

return (0);
}
