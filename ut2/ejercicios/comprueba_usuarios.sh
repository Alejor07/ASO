#!/bin/bash
# Nombre:      comprueba_usuario.sh

# Uso:         ./comprueba_usuario.sh USUARIO

# Qué hace: Dice si un usuario existe y, si existe, si pertenece al grupo sudo (si puede administrar el sistema).

# Salida:      0 si el usuario existe
#              1 si no se recibe exactamente un argumento
#              2 si el usuario no existe

# 1. Comprobar que se ha recibido un nombre de usuario.
if [ $# -ne 1 ]; then
    echo "Uso: $0 USUARIO" >&2
    exit 1
fi

usuario=$1

# 3. ¿Existe el usuario?
# NOTA: aquí la condición del if NO es [ ], sino un comando: id.
#       if mira el CÓDIGO DE SALIDA del comando: si es 0 (id ha encontrado
#       al usuario), se cumple; si es otro número, no se cumple.
# NOTA: &> /dev/null tira a la «papelera» todo lo que id muestra (salida y
#       errores): solo nos interesa su código de salida.
if id "$usuario" &> /dev/null; then
    echo "El usuario $usuario existe"
else
    echo "El usuario $usuario no existe" >&2
    exit 2
fi


