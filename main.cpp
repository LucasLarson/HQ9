/***
  *
  * HQ9+ 🍋
  *
  * Lucas Larson
  * copyright GPL v3.0+
  * https://git.io/HQ9+
  *
  */

#include <climits>
#include <cstring>
#include <iostream>
#include <string>

#include "beer.hpp"
#include "helloWorld.hpp"
#define BUFFER_SIZE INT_MAX / UCHAR_MAX - USHRT_MAX

int main() {
  char input[BUFFER_SIZE];
  std::cin.width(BUFFER_SIZE);
  unsigned long long plus = 0;
  std::cout << std::string(25, '\n');
  std::cout << "This is HQ9+" << std::endl;
  std::cout << "interpreted by C++20" << std::endl;
  std::cout << "  a Lucas Larson production" << std::string(3, '\n');
  for (;;) {
    std::cout << "↪ ";
    std::cin >> input;
    input[BUFFER_SIZE - 1] = '\0';
    for (unsigned long long index = 0; index < strnlen(input, BUFFER_SIZE);
         index++) {
      if (input[index] == 'H') {
        helloWorld();
      } else if (input[index] == 'Q') {
        printf("%s\n", input);
      } else if (input[index] == '9') {
        beer();
      } else if (input[index] == '+') {
        plus++;
#if DEBUG
        printf("%llu\n", plus);
#endif // DEBUG
      } else {
        return 1;
      }
    }
  }
}
