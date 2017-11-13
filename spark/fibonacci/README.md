## Weryfikacja

### SPARK 2016

```bash
gnatprove -P fibonacci.gpr --prover=z3
```

### SPARK Discovery 2017

Nie weryfikuje się z powodu rekurencyjnego kontraktu w funkcji Fibonacci.

