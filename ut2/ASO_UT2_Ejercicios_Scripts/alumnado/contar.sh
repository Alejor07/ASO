#!/bin/bash
# contar.sh - Cuenta los ficheros y directorios de una ruta
ruta=${1:-.}
ficheros=0
directorios=0

for e in "$ruta"/*; do
    if [ -f "$e" ]; then
        ficheros=$((ficheros + 1))
    elif [ -d "$e" ] then
        directorios=$((directorios + 1))
    fi
done

echo "En $ruta hay $ficheros ficheros y $directorios directorios
