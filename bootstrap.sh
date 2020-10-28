#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

author="Lucas Larson"
program="HQ9+"
printf 'Welcome to %s\n  a %s production\n\n' "$(basename "$0")" "$author"

platform="$(uname)" && export platform
printf 'platform set to %s\n' "$platform"
printf 'beginning compilation...\n'

# create C++20 executable for macOS, if not then for Linux
if [[ Darwin == "$platform" ]]; then
  clang++ -std=c++2a --verbose -Wall -Wextra -pedantic -g -integrated-as -lm \
    -lstdc++ -O0 -pthread -save-stats -save-temps -v -fcaret-diagnostics \
    -fdiagnostics-fixit-info -fdiagnostics-parseable-fixits \
    -fdiagnostics-print-source-range-info -fdiagnostics-show-option \
    -fno-builtin -fshow-column -fshow-source-location -fstandalone-debug \
    -ftime-report main.cpp helloWorld.cpp beer.cpp \
    -o "$program"

elif [[ Linux == "$platform" ]]; then
  g++ --verbose -Wall -Wextra -pedantic -save-temps -v -fgnu-tm -lm -latomic \
    -lstdc++ -g -fgnat-encodings=all main.cpp helloWorld.cpp beer.cpp \
    -o "$program"

fi

printf '\n\nSetting the compiled file\xe2\x80\x99s permissions...\n\n'
chmod 755 "$program"

# check if the variable is still set
# and the program is in fact executable
if [[ -n $program && -x ./$program ]]; then
  printf 'Compiled program verified as executable...\n\n'
else

  # use the failed `if`’s return code
  # https://github.com/ohmyzsh/ohmyzsh/pull/9238#discussion_r484806772
  return $?
fi

# test running the executable ourselves
# succeed only if author’s name appears within 3 seconds of opening it
printf 'Checking the executable\xe2\x80\x99s output...\n\n'

if [[ "$(timeout 3 ./$program 2>&1)" =~ $author ]]; then
  printf '\xe2\x9c\x85  %s interpreter bootstrapping succeeded.\n\n' "$program"
  printf 'Activate it by entering: ./%s\n' "$program"
  printf 'then press return.\n\n\n'
fi
