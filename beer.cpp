#include "beer.hpp"
#include <iostream>

void beer() {
  int i = 99;
#define wall " of beer on the wall"
  while (i > 1) {
    printf("%d bottle%c%s,\n", i, i == 1 ? '\0' : 's', wall);
    printf("%d bottle%c of beer,\n", i, i == 1 ? '\0' : 's');
    printf("take 1 down, pass it around,\n");
    printf("%d bottle%c%s.\n\n", i - 1, (i - 1) == 1 ? '\0' : 's', wall);
    i--;
  }
  printf("1 bottle%s,\n1 bottle of beer,\n", wall);
  printf("take 1 down and pass it around,\n");
  printf("no more bottles%s.\n\n", wall);
  printf("No more bottles%s,\n", wall);
  printf("no more bottles of beer,\n");
  printf("go to the store and buy some more,\n");
  printf("99 bottles%s.\n", wall);
}
