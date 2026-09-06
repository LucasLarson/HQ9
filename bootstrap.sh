#!/bin/sh

author='Lucas Larson'
program='./HQ9+'
printf -- 'Welcome to %s\n  a %s production\n\n' "$(basename -- "${0-}")" "${author-}"

# fail without `$CXX` or `clang++` or `g++`
set -- "$(command -v -- "${CXX-}" || command -v -- clang++ || command -v -- g++)"
if command -v -- "${1-}" >/dev/null 2>&1; then
  find -- . \
    -name '*.cpp' \
    -type f \
    -exec "${1-}" -g -lm -v -o "${program-}" -- {} +
elif command -v -- cmake >/dev/null 2>&1; then
  cmake . &&
    make
else
  printf -- 'Error: no C++ compiler found.\n' >&2
  # EX_UNAVAILABLE
  exit 69
fi

command -v -- "${program-}" >/dev/null 2>&1 || {
  printf -- 'Error: the compiler created no executable.\n' >&2
  exit 127
}

printf -- '\n\n%s  %s bootstrapping appears to have succeeded.\n\n' "✅" "$(basename -- "${program-}")" >&2
printf -- 'Activate it by entering: %s\n' "${program-}" >&2
printf -- 'then press return or enter.\n\n\n' >&2
