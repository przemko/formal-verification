# Przykład Turinga

## Kompilacja i uruchamianie

```
$ gprbuild 
using project file turing.gpr
Compile
   [Ada]          main.adb
   [Ada]          turing.adb
Bind
   [gprbind]      main.bexch
   [Ada]          main.ali
Link
   [link]         main.adb
$ ./main
 479001600
```

## Formalna weryfikacja

Weryfikacja:
```
$ gnatprove -P turing.gpr 
Phase 1 of 2: generation of Global contracts ...
Phase 2 of 2: flow analysis and proof ...
turing.adb:14:20: medium: overflow check might fail
Summary logged in /Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/gnatprove/gnatprove.out
```
Zawartość pliku z raportem:
```
$ more gnatprove/gnatprove.out 
Summary of SPARK analysis
=========================

-----------------------------------------------------------------------------------------------------------
SPARK Analysis results        Total        Flow   Interval   CodePeer        Provers   Justified   Unproved
-----------------------------------------------------------------------------------------------------------
Data Dependencies                 .           .          .          .              .           .          .
Flow Dependencies                 .           .          .          .              .           .          .
Initialization                   11          11          .          .              .           .          .
Non-Aliasing                      .           .          .          .              .           .          .
Run-time Checks                   6           .          .          .    5 (altergo)           .          1
Assertions                        5           .          .          .    5 (altergo)           .          .
Functional Contracts              .           .          .          .              .           .          .
LSP Verification                  .           .          .          .              .           .          .
-----------------------------------------------------------------------------------------------------------
Total                            22    11 (50%)          .          .       10 (45%)           .     1 (5%)


Analyzed 2 units
in unit main, 0 subprograms and packages out of 1 analyzed
  Main at main.adb:4 skipped
in unit turing, 2 subprograms and packages out of 2 analyzed
  Turing at turing.ads:1 flow analyzed (0 errors and 0 warnings) and proved (0 checks)
  Turing.Comp at turing.ads:3 flow analyzed (0 errors and 0 warnings) and not proved, 10 checks out of 11 proved
```

## Usuwanie zbędnych plików

```
$ gprclean 
using project file turing.gpr
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/turing.o" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/turing.ali" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/turing.adb.stdout" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/turing.adb.stderr" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/main.o" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/main.ali" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/main.adb.stdout" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/main.adb.stderr" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/main" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/b__main.o" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/b__main.ads" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/b__main.adb" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/b__main.ali" has been deleted
"/Users/przemko/Repositories/github/przemko/formal-verification/spark/turing/main.bexch" has been deleted
$ gnatprove -P turing.gpr --clean
```
