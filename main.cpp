#include <cstring>
#include <iostream>
#include <string>

#include "beer.hpp"

int main() {
    char input[999999];
    std::cout << std::string(25, '\n');
    std::cout << "This is HQ9+" << std::endl;
    std::cout << "interpreted by C++20" << std::endl;
    std::cout << "  a Lucas Larson production" << std::string(3, '\n');
    for (;;) {
        std::cout << "↪ ";
        std::cin >> input;
        for (unsigned int index = 0; index < strlen(input); index++) {
            if (input[index] == 'H') {
                printf("Hello, world!\n");
            } else if (input[index] == 'Q') {
                printf("%s\n", input);
            } else if (input[index] == '9') {
                beer();
            } else if (input[index] == '+') {
                int plus = 0;
                plus++;
#if DEBUG
                printf("%index\n", plus);
#endif /* DEBUG */
            } else {
                return 1;
            }
        }
    }
}
