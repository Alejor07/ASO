#!/bin/bash

# Nombre:      comprueba_usuario.sh

# Uso:         ./comprueba_usuario.sh USUARIO

# Qué hace: Dice si un usuario existe y, si existe, si pertenece al grupo sudo (si puede administrar el sistema).


# 1. Comprobar que se ha recibido un nombre de usuario.
if [ $# -eq 0 ]; then
    echo "Uso: $0 USUARIO" >&2
    exit 2
fi
# 2. Poner el CONTADOR a 0

usuario=$1
contador=0
existen=0

# 3. ¿Existe el usuario?
# NOTA: aquí la condición del if NO es [ ], sino un comando: id.
#       if mira el CÓDIGO DE SALIDA del comando: si es 0 (id ha encontrado
#       al usuario), se cumple; si es otro número, no se cumple.
# NOTA: &> /dev/null tira a la «papelera» todo lo que id muestra (salida y
#       errores): solo nos interesa su código de salida.
for usuario in "$@"; do

if id "$usuario" &> /dev/null; then
    echo "El usuario $usuario existe"
    existen=$((existen + 1))

else
    echo "El usuario $usuario no existe" >&2

fi

contador=$((contador + 1))

done

echo "Existen $existen "

if [ "$existen" -eq $# ]; then
    exit 1
 
 else
    exit 0

fi