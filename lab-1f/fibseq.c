#include <stdio.h>

extern long long fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  long long result=0;

  scanf("%d",&number);
  result = fibonacci(number);   
  printf("The fibonacci sequence at %d is: %lld\n", number, result);
}

