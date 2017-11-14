# Automat skończony

## Weryfikacja

### SPARK GPL 2016

```bash
gnatprove -P automata.gpr
```

### SPARK Discovery 2017

Wymaga programu Z3:
```bash
gnatprove -P automata.gpr --prover=z3
```

