# HQ9
<!-- TOC depthFrom:2 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [Build](#build)
- [Background](#background)
  - [HQ9](#hq9-1)
  - [C](#c)
    - [89](#89)
  - [C89.5](#c895)

<!-- /TOC -->
This is an interpreter of the HQ9 programming language, written in C89. It supports the entire HQ9 language. The output of the 9 argument is Rosetta Stone-compliant and takes a balanced approach to the recursion-versus-readability problem.

## Build
This interpreter can be built and tested on almost any C compiler built since the 1980s. Testing beyond compilation was completed using Clang 11.0.3 on macOS 10.15.5.
1.  Get the code
```shell
git clone --verbose --recurse-submodules --progress \
 --branch main https://github.com/LucasLarson/HQ9
```
2.  move to the newly downloaded content
```shell
cd HQ9
```
3.  build the executable for your machine
```shell
clang main.c \
 --verbose -std=c89 -ffreestanding -fno-builtin -O0 -g \
 -fstandalone-debug -save-temps -save-stats -integrated-as \
 -ftime-report -fshow-column -fshow-source-location \
 -fcaret-diagnostics -fdiagnostics-fixit-info \
 -fdiagnostics-parseable-fixits -fdiagnostics-print-source-range-info \
 -fdiagnostics-show-option -o HQ9
```
4.  add HQ9 to your PATH
```shell
export PATH="$PWD:$PATH"
```
5.  replace `H` with any element from the entire language, like `Q` or `9`
```shell
   HQ9 H \
|| HQ9 Q \
|| HQ9 9
```
---
## Background
### HQ9
HQ9 is a streamlined version of the more popular HQ9+ programming language, which was written by Cliff L. Biffle in the early 2000s.

### C
C is the more popular successor to the B programming language, which was written by Dennis Ritchie and Ken Thompson in the mid-1900s.

#### 89
C89 is the functional equivalent of ANSI C and was published in the late 1900s.

### C89.5
There has long been an excellent public radio station in Seattle broadcasting at 89½ MHz. In spoken vernacular, it, too, is often referred to as C89. Please [support](https://c895.org/donate) their work.
