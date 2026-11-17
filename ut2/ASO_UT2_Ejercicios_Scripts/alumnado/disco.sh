#!/bin/bash
# script
x=$(df --output=pcent / | tail -n 1 | tr -dc '0-9')   # x es igual a df
if [ "$x" -ge 80 ]; then      # si x es mayor o igual que 80
    echo "Aviso: $x"          # muestra aviso
else                          # si no
    echo "OK: $x"             # muestra ok
fi                            # fin del if
