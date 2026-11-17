#!/bin/bash
# ==============================================================
# Nombre:      calcula.sh  (versión del ejercicio 4.1)
# Ejercicio:   4.1 - Calculadora
# Descripción: Recibe dos números enteros y muestra su suma, resta,
#              producto, división entera, resto y qué porcentaje es el
#              primero del segundo.
# Uso:         ./calcula.sh NUMERO1 NUMERO2
# NOTA:        Esta versión todavía falla si el segundo número es 0.
#              Se corrige en el ejercicio 5.4 (ver bloque5/calcula_5.4.sh).
# ==============================================================

numero1=$1
numero2=$2

if [ "$numero2" -eq 0 ] ; then
echo "la cagaste brodi" 2> errores.txt
exit 1
fi

# NOTA: las variables guardan TEXTO. Para hacer cuentas hay que usar
#       $(( )). Dentro no hace falta poner $ delante de las variables.
#       Bash solo trabaja con números ENTEROS.
suma=$((numero1 + numero2))
resta=$((numero1 - numero2))
producto=$((numero1 * numero2))
# NOTA: / es la división ENTERA: 17 / 5 = 3 (se pierden los decimales).
division=$((numero1 / numero2))
# NOTA: % es el RESTO de la división entera: 17 % 5 = 2.
resto=$((numero1 % numero2))

# Porcentaje con dos decimales.
# NOTA: como $(( )) no admite decimales, usamos la calculadora bc.
#       echo le pasa la operación por una tubería y scale=2 indica que
#       queremos 2 decimales. Se multiplica por 100 ANTES de dividir.
porcentaje=$(echo "scale=2; $numero1 * 100 / $numero2" | bc)

echo "Suma:       $suma"
echo "Resta:      $resta"
echo "Producto:   $producto"
echo "División:   $division"
echo "Resto:      $resto"
echo "Porcentaje: $porcentaje %"

# --------------------------------------------------------------
# EJEMPLOS DE EJECUCIÓN
#
#   $ ./calcula.sh 17 5
#   Suma:       22
#   Resta:      12
#   Producto:   85
#   División:   3
#   Resto:      2
#   Porcentaje: 340.00 %
#
#   $ ./calcula.sh 17 0
#   ./calcula.sh: line 23: numero1 / numero2: division by 0 (error token is "numero2")
#   ./calcula.sh: line 25: numero1 % numero2: division by 0 (error token is "numero2")
#   Runtime error (func=(main), adr=18): Divide by zero
#   Suma:       17
#   Resta:      17
#   Producto:   0
#   División:
#   Resto:
#   Porcentaje:  %
# NOTA: no se puede dividir entre 0. Bash da un error, deja vacías la
#       división y el resto, y SIGUE ejecutando el resto del script.
#       bc también da su propio error. Hay que comprobar antes el
#       segundo número: eso se hace en el ejercicio 5.4.
# --------------------------------------------------------------
