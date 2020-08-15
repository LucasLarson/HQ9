#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

printf 'Welcome to %s\n' "$(basename "$0")"

platform="$(uname)" && export platform
printf 'platform set to %s\n' "$platform"
printf 'beginning compilation...\n'

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

printf '\n\nSetting the compiled file to run as an application...\n'
chmod 755 HQ9+
if [[ -x ./HQ9+ ]]; then
  printf 'program verified as executable\n'
else
  return 1
fi

clear && clear
./HQ9+
