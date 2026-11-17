#!/bin/bash
# ==============================================================
# Nombre:      saluda.sh
# Ejercicio:   2.5 - Parámetros de posición
# Descripción: Saluda a una persona y le da la bienvenida a su
#              departamento (Sistemas si no se indica otro).
# Uso:         ./saluda.sh NOMBRE [DEPARTAMENTO]
# ==============================================================

# NOTA: $1 es el primer argumento que escribes detrás del nombre del
#       script y $2 el segundo. Los argumentos se separan por ESPACIOS.
nombre=$1

# NOTA: ${2:-Sistemas} significa «el valor de $2 y, si está vacío,
#       la palabra Sistemas». Es un valor por defecto.
departamento=${2:-Sistemas}

# NOTA: $0 = nombre con el que se ha ejecutado el script.
#       $# = cuántos argumentos ha recibido.
#       $* = todos los argumentos juntos, separados por un espacio.
echo "Script:                $0"
echo "Número de argumentos:  $#"
echo "Todos los argumentos:  $*"
echo "Hola, $nombre. Te damos la bienvenida al departamento de $departamento."

# --------------------------------------------------------------
# EJEMPLOS DE EJECUCIÓN
#
#   $ ./saluda.sh Ana Recursos Humanos
#   Script:                ./saluda.sh
#   Número de argumentos:  3
#   Todos los argumentos:  Ana Recursos Humanos
#   Hola, Ana. Te damos la bienvenida al departamento de Recursos.
# NOTA: sin comillas, «Recursos» y «Humanos» son DOS argumentos
#       ($2 y $3). Solo $2 llega a la variable departamento.
#
#   $ ./saluda.sh Ana "Recursos Humanos"
#   Script:                ./saluda.sh
#   Número de argumentos:  2
#   Todos los argumentos:  Ana Recursos Humanos
#   Hola, Ana. Te damos la bienvenida al departamento de Recursos Humanos.
# NOTA: con comillas, «Recursos Humanos» es UN solo argumento ($2).
#
#   $ ./saluda.sh Luis
#   Script:                ./saluda.sh
#   Número de argumentos:  1
#   Todos los argumentos:  Luis
#   Hola, Luis. Te damos la bienvenida al departamento de Sistemas.
# NOTA: no hay $2, así que se usa el valor por defecto.
# --------------------------------------------------------------
