#include <stdio.h>


int main(int argc, char **argv)
{



if (strcmp(argv[1], "char") == 0)
{
	printf("an %s is %u bytes on this box\n", argv[1], sizeof(char));
}

if (strcmp(argv[1], "double") == 0)
{
	printf("an %s is %u bytes on this box\n", argv[1], sizeof(double));
}

if (strcmp(argv[1], "int") == 0)
{
	printf("an %s is %u bytes on this box\n", argv[1], sizeof(int));
}

	return (0);	
}
