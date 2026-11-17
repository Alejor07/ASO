#!/bin/bash
# ==============================================================
# Nombre:      media.sh  (corregido)
# Ejercicio:   7.2 - Errores de ejecución y de lógica
# Descripción: Calcula la suma y la media (entera) de los números
#              recibidos como argumentos.
# Uso:         ./media.sh NUMERO...
# Salida:      0 si ha podido calcular
#              1 si no se recibe ningún número
#
# ERRORES CORREGIDOS:
#   1. Línea 9, LÓGICA: $sum en lugar de $suma. Esa variable no existe y
#      sale vacía («Suma:» sin número). Lo detectan bash -u («sum: unbound
#      variable») y ShellCheck. Corrección: $suma.
#   2. Línea 5, LÓGICA: suma=$suma+$n no suma: guarda el TEXTO 0+4+6+8.
#      Es el error que aparece al corregir el 1: sale «Suma: 0+4+6+8».
#      Se ve con bash -x. Corrección: suma=$((suma + n)).
#      NOTA: la media salía bien (6) por casualidad: dentro de $(( )),
#      Bash calcula el texto 0+4+6+8 como una operación.
#   3. Línea 4: $@ sin comillas. ShellCheck avisa (SC2068).
#      Corrección: "$@".
#   4. EJECUCIÓN: sin argumentos, $# vale 0 y la media divide entre 0
#      («division by 0»). Corrección: comprobar al principio que hay
#      números; si no, mensaje de uso y exit 1.
# ==============================================================

# CORREGIDO (4): sin números no se puede calcular la media.
if [ $# -eq 0 ]; then
    echo "Uso: $0 NUMERO..." >&2
    exit 1
fi

suma=0

# CORREGIDO (3): "$@" entre comillas = todos los argumentos, cada uno
#                por separado.
for numero in "$@"; do
    # CORREGIDO (2): las sumas se hacen con $(( )).
    suma=$((suma + numero))
done

# NOTA: $# es cuántos números se han recibido. La división es ENTERA.
media=$((suma / $#))

echo "Números: $#"
# CORREGIDO (1): la variable se llama suma, no sum.
echo "Suma:    $suma"
echo "Media:   $media"

exit 0

# --------------------------------------------------------------
# EJEMPLOS DE EJECUCIÓN
#
#   $ ./media.sh 4 6 8
#   Números: 3
#   Suma:    18
#   Media:   6
#
#   $ ./media.sh; echo $?
#   Uso: ./media.sh NUMERO...
#   1
#
#   $ shellcheck media.sh        (no muestra nada: sin avisos)
# --------------------------------------------------------------
