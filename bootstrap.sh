#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

author="Lucas Larson"
printf 'Welcome to %s\n  a %s production\n\n' "$(basename "$0")" "$author"

platform="$(uname)" && export platform
printf 'platform set to %s\n' "$platform"
printf 'beginning compilation...\n'

# create C++20 executable for macOS, if not then for Linux
if [[ Darwin = "$platform" ]]; then
  clang++ -std=c++2a --verbose -Wall -Wextra -pedantic -g -integrated-as -lm \
    -lstdc++ -O0 -pthread -save-stats -save-temps -v -fcaret-diagnostics \
    -fdiagnostics-fixit-info -fdiagnostics-parseable-fixits \
    -fdiagnostics-print-source-range-info -fdiagnostics-show-option \
    -fno-builtin -fshow-column -fshow-source-location -fstandalone-debug \
    -ftime-report main.cpp beer.cpp -o "HQ9+"

elif [[ "Linux" = "$platform" ]]; then
  g++ --verbose -Wall -Wextra -pedantic -save-temps -v -fgnu-tm -lm -latomic \
    -lstdc++ -g -fgnat-encodings=all main.cpp beer.cpp -o "HQ9+"

fi

printf '\n\nSetting the compiled file\xe2\x80\x99s permissions...\n\n'
chmod 755 HQ9+

# check if the executable is in fact executable
if [[ -x ./HQ9+ ]]; then
  printf 'Compiled program verified as executable...\n\n'
else
  return 1
fi

# test running the executable ourselves
# succeed only if author’s name appears within 3 seconds of opening it
printf 'Checking the executable\xe2\x80\x99s output...\n\n'

if [[ "$(timeout 3 ./HQ9+ 2>&1)" =~ $author ]]; then
  printf '\xe2\x9c\x85 HQ9+ interpreter bootstrapping succeeded.\n\n'
  printf 'Activate it by entering: ./HQ9+\n'
  printf 'then press return.\n\n\n'
fi
