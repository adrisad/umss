# Apunte de clase 01

## Esquema Entrada / Salida

```
[Entrada] ----> Cumplen Condicion   Ev
   |                                Env
   v
[Salida]   Sv
           Snv
```

- **Entrada** cumple condición → E_v (entrada válida), E_nv (entrada no válida)
- **Salida** → S_v (salida válida), S_nv (salida no válida)

## Eficiencia

- Completo
- $\forall S_v \; \exists E_v \; / \; P(E_v) \Rightarrow S_v$
- (lo contrario)

## Correctitud

- **Robusto** → Excep(ción)
- $E_{nv} \Rightarrow S_{nv}$

> **Nota:** En esta materia no se tocará el tema de robustez.
