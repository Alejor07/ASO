#!/bin/bash
# media.sh - Calcula la suma y la media de los números recibidos
suma=0
for n in $@; do
    suma=$suma+$n
done
media=$((suma / $#))
echo "Números: $#"
echo "Suma:    $sum"
echo "Media:   $media"
