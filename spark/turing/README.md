#Przykład Turinga

## Kompilacja i uruchamianie

```
$ gprbuild 
using project file turing.gpr
gcc -c main.adb
gcc -c turing.adb
gprbind main.bexch
gnatbind main.ali
gcc -c b__main.adb
gcc main.o -o main
$ ./main
 479001600
```

## Formalna weryfikacja

```
$ gnatprove -P turing.gpr --prover=z3
Phase 1 of 2: generation of Global contracts ...
Phase 2 of 2: flow analysis and proof ...
Summary logged in /Users/przemko/Documents/lang/formal-verification/spark/turing/gnatprove/gnatprove.out
```
Zawartość pliku z raportem:
```
$ more gnatprove/gnatprove.out 
Summary of SPARK analysis
=========================

-------------------------------------------------------------------------------------------------------
SPARK Analysis results        Total       Flow   Interval   CodePeer     Provers   Justified   Unproved
-------------------------------------------------------------------------------------------------------
Data Dependencies                 .          .          .          .           .           .          .
Flow Dependencies                 .          .          .          .           .           .          .
Initialization                    7          7          .          .           .           .          .
Non-Aliasing                      .          .          .          .           .           .          .
Run-time Checks                   8          .          .          .      8 (Z3)           .          .
Assertions                        4          .          .          .      4 (Z3)           .          .
Functional Contracts              7          .          .          .      7 (Z3)           .          .
LSP Verification                  .          .          .          .           .           .          .
-------------------------------------------------------------------------------------------------------
Total                            26    7 (27%)          .          .    19 (73%)           .          .


Analyzed 2 units
in unit main, 0 subprograms and packages out of 1 analyzed
  Main at main.adb:4 skipped
in unit turing, 3 subprograms and packages out of 3 analyzed
  Turing at turing.ads:1 flow analyzed (0 errors and 0 warnings) and proved (0 checks)
  Turing.Comp at turing.ads:15 flow analyzed (0 errors and 0 warnings) and proved (10 checks)
  Turing.Factorial at turing.ads:3 flow analyzed (0 errors and 0 warnings) and proved (9 checks)
```
Gdyby mimo zastosowania programu dowodzącego **Z3** nie powiodło się udowodnienie wszystkich warunków, wówczas można zadać większą liczbę dopuszczalnych kroków dowodzenia stosując parametr **--steps=N**:
```
$ gnatprove -P turing.gpr --prover=z3 --steps=250
```

## Usuwanie zbędnych plików
  
```
$ gprclean
using project file turing.gpr
"/Users/przemko/Documents/lang/formal-verification/spark/turing/turing.o" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/turing.ali" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/main.o" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/main.ali" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/main" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/b__main.o" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/b__main.ads" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/b__main.adb" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/b__main.ali" has been deleted
"/Users/przemko/Documents/lang/formal-verification/spark/turing/main.bexch" has been deleted
$ gnatprove -P turing.gpr --clean
```
