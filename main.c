#include "ft_printf.h"
#include <stdio.h>
#include <math.h>
#include <limits.h>


int main()
{
	char *s = "Hello world and man";
	int i = 25;
	int t = 0; 
	long double f = 10.0;
	int x = -1948409568;

	ft_printf("%.10Lf\n", f);
	printf("%.10Lf\n", f);

	// ft_printf("%-#14.3O\n",12);
	// printf("%-#14.3O\n",12);
}

