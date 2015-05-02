function fib(n)
{
 if(n < 2) return(1);
 return(fib(n-2) + fib(n-1));
}
BEGIN
{
 printf("%d\n", fib(10));
 exit;
}

