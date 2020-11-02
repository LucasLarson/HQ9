# HQ9+

[![CodeFactor](https://www.codefactor.io/repository/github/lucaslarson/hq9/badge)](https://www.codefactor.io/repository/github/lucaslarson/hq9)
[![Gitpod: ready to code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/LucasLarson/HQ9)
[![Run on Repl.it](https://repl.it/badge/github/LucasLarson/HQ9)](https://repl.it/github/LucasLarson/HQ9)
[![Google: ready to build](https://img.shields.io/badge/Google%20Cloud%20Shell-build-5391fe?logo=google-cloud&logoColor=fff)](https://console.cloud.google.com/cloudshell/open?git_repo=https://github.com/LucasLarson/HQ9)
[![Codeac](https://static.codeac.io/badges/2-274529532.svg "Codeac.io")](https://app.codeac.io/github/LucasLarson/HQ9)
[![C++ CI](https://github.com/LucasLarson/HQ9/workflows/C++%20CI/badge.svg)](https://github.com/LucasLarson/HQ9/actions?query=workflow:"C%2B%2B+CI")
[![Super-Linter](https://github.com/LucasLarson/HQ9/workflows/Super-Linter/badge.svg)](https://github.com/LucasLarson/HQ9/actions?query=workflow:"Super-Linter")
[![CodeQL analysis](https://github.com/LucasLarson/HQ9/workflows/CodeQL%20analysis/badge.svg)](https://github.com/LucasLarson/HQ9/actions?query=workflow:"CodeQL%20analysis")
[![DeepCode](https://www.deepcode.ai/api/gh/badge?key=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwbGF0Zm9ybTEiOiJnaCIsIm93bmVyMSI6Ikx1Y2FzTGFyc29uIiwicmVwbzEiOiJIUTkiLCJpbmNsdWRlTGludCI6ZmFsc2UsImF1dGhvcklkIjoxNTg0MiwiaWF0IjoxNTk5NzU0OTk0fQ.2vnmnRClDJONlco1vdiqOJt7gNYiqnT9kyWxFZ_vFuw)](https://www.deepcode.ai/app/gh/LucasLarson/HQ9/_/dashboard)
[![GPLP](https://img.shields.io/badge/license-GPLP-blue "GNU General Public License for Pedants")](https://github.com/LucasLarson/HQ9/blob/main/LICENSE.md)

<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Build](#build)
- [Background](#background)
  - [C](#c)
    - [C89](#c89)
      - [C89.5](#c895)
  - [C++](#c-1)
    - [C++20](#c20)
- [Implementation](#implementation)

<!-- /TOC -->

This is an interpreter of the entire HQ9+ programming language, implemented
in&nbsp;C++20. The output of&nbsp;`9` is Rosetta&nbsp;Stone-compliant and takes
a balanced approach to the recursion-versus-readability&nbsp;problem.

## Build

This interpreter can be built and tested with almost any C++ compiler built
since the&nbsp;2010s. Testing beyond compilation was completed using
Clang&nbsp;12.0.0 on macOS&nbsp;11.0&nbsp;beta and GCC&nbsp;8.3.0 on
Alpine&nbsp;Linux&nbsp;3.10.0 on iSH&nbsp;1.0&nbsp;(73) on
iOS&nbsp;14.0&nbsp;beta.

1. Open a terminal and get the&nbsp;code

```shell
git clone --verbose --recurse-submodules --progress \
  --branch main https://github.com/LucasLarson/HQ9
```

2. move to the newly downloaded&nbsp;content

```shell
cd HQ9 || return 1
```

3. build the executable for your&nbsp;machine

```shell
clang++ -std=c++2a --verbose -v -Wall -Wextra -pedantic -g -lm -lstdc++ -O0 \
  -fcaret-diagnostics -fdiagnostics-fixit-info -fdiagnostics-parseable-fixits \
  -fdiagnostics-print-source-range-info -fdiagnostics-show-option -fident \
  -fno-builtin -fshow-column -fshow-source-location -fstandalone-debug \
  -ftime-report -ftrapv -integrated-as -pthread -save-stats -save-temps \
  $(find * -iname '*\.cpp') -o HQ9+ || ./bootstrap.sh
```

4. run the&nbsp;executable

```shell
./HQ9+
```

5. try any combination of input specified in the&nbsp;language. My
   favorite’s&nbsp;`9`:

```shell
9
```

---

## Background

HQ9+ is a programming language written by Cliff L. Biffle in the
early&nbsp;2000s. <!--
oldest extant copy of the specification:
web.archive.org/web/20010511232301id_/cliff.biffle.org/esoterica/hq9plus.html
-->

### C

C, written by Dennis Ritchie and Ken Thompson in the&nbsp;mid‑1900s, is the more
popular successor to the B&nbsp;programming&nbsp;language.

#### C89

C89 is the functional equivalent of ANSI&nbsp;C and was published in the
late&nbsp;1900s. In 2020,
[v0.3.1 of this HQ9+ interpreter](https://github.com/LucasLarson/HQ9/tree/v0.3.1)
was published in&nbsp;C89.

##### C89.5

There has long been an excellent public radio station in Seattle broadcasting
at 89½ MHz. In spoken vernacular, it, too, is often referred to as&nbsp;C89.
Please [support](https://c895.org/donate) their important&nbsp;work.

### C++

C++ is a grandchild language of the B&nbsp;programming language and a superset
of its parent language,&nbsp;C.

#### C++20

The release of the version of the C++ programming language whose features were
finalized just prior to a pandemic, but which at release time, had still not
been incorporated into an ISO&nbsp;standard. In 2020,
[v1.0.0 of this HQ9+ interpreter](https://github.com/LucasLarson/HQ9/tree/v1.0.0)
was published in&nbsp;C++20.

---

## Implementation

Where a specification omits implementation details&nbsp;– where a language’s
behavior is undefined&nbsp;– it is the interpreter’s right or responsibility to
map conditions to specific behavior where agnosticism&nbsp;fails. That is,
unspecified conditions must result in implementation-defined&nbsp;behavior.

For example, the HQ9+ specification implies the machine running it has infinite
memory and that the length of input itself have asymptotic similarity
to&nbsp;infinity. The devices on which this interpreter was tested had unclear
limits, but in all cases, those limits were unambiguously finite, as are the
lengths of primitive variable types in C and&nbsp;C++.

Similarly, the specification does not detail how the accumulator’s value is
accessed after its initialization at&nbsp;`0`. In an abundance of caution, and
without drawing conclusions, this implementation is responsive to the ambiguity
by tracking the accumulator’s value, but preventing accession to&nbsp;it.
Further research must verify whether this is a safer alternative than writing
to&nbsp;`/dev/null`, which may raise concerns about data&nbsp;loss.
