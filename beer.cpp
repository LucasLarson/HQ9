/**

  HQ9+ 🍋

  Lucas Larson
  copyright GPL v3.0+
  https://git.io/HQ9+

*/

#include "beer.hpp"
#include <iostream>

void beer() {

  int i = 99;

#define wall " of beer on the wall"

  while (i > 1) {

    // `i` bottles of beer on the wall
    // where `i` is 2 to 99
    printf("%d bottles%s,\n", i, wall);

    // `i` bottles of beer,
    // where `i` is the same number as above
    printf("%d bottles of beer,\n", i);

    printf("take 1 down, pass it around,\n");

    // either
    // `i` was 3 to 99 above and return `i bottles of beer on the wall.` or
    // `i` was 2 and return `1 bottle\0 of beer on the wall.`
    printf("%d bottle%c%s.\n\n", i - 1, i == 2 ? '\0' : 's', wall);

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
