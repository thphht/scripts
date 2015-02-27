#include <stdio.h>
#include <stdlib.h>


char *p = "hello world";

void main(void)
{
  register int t;

  printf(p);
  for(t=strlen(p)-1; t>-1 ; t-- ) printf("%c", p[t]);
}
