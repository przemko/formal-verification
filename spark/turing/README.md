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
