#!/bin/sh
if which clang > /dev/null; then
  clang main.c \
    --verbose -std=c89 -ffreestanding -fno-builtin -O0 -g \
    -fstandalone-debug -save-temps -save-stats -integrated-as \
    -ftime-report -fshow-column -fshow-source-location \
    -fcaret-diagnostics -fdiagnostics-fixit-info \
    -fdiagnostics-parseable-fixits -fdiagnostics-print-source-range-info \
    -fdiagnostics-show-option -o HQ9 && \
  export PATH="$PWD:$PATH" && \
  printf '\n\n\xe2\x9c\x85 bootstrap successfully completed\n\n' && \
  printf '           now run `HQ9 H`,\n' && \
  sleep 1.0 && \
  printf '                or `HQ9 Q`,\n' && \
  sleep 1.5 && \
  printf '   or my favorite, `HQ9 9`!\n\n\n' && \
  sleep 1.5 || \
  printf '\n\n\xf0\x9f\x9a\xab bootstrap failed\n\n'
else
  prinf '\n\n\xe2\x9a\xa0\xef\xb8\x8f please install clang first\n\n'
fi
