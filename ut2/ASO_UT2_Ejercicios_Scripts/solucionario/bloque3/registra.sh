#!/bin/bash
# ==============================================================
# Nombre:      registra.sh
# Ejercicio:   3.4 - Un registro de actividad
# Descripción: Añade al fichero de registro una línea con la fecha y
#              la hora, el usuario y el mensaje recibido.
# Uso:         ./registra.sh MENSAJE
# ==============================================================

# Fichero donde se guardan los mensajes.
# NOTA: $HOME es una variable de entorno con tu carpeta personal
#       (/home/ana). Se usa $HOME y no ~ porque ~ no se expande
#       dentro de comillas.
fichero_registro="$HOME/ut2/ejercicios/registro.log"

# Fecha y hora con el formato 2026-10-20 09:20:13
# NOTA: %Y año, %m mes, %d día, %H hora, %M minutos, %S segundos.
fecha_hora=$(date '+%Y-%m-%d %H:%M:%S')

# NOTA: $* junta todos los argumentos en un solo texto. Así el mensaje
#       funciona tanto con comillas como sin ellas.
mensaje="$*"

# NOTA: >> AÑADE la línea al final del fichero (si no existe, lo crea).
#       Con un solo > se borraría todo lo anterior cada vez.
echo "$fecha_hora [$USER] $mensaje" >> "$fichero_registro"

echo "Mensaje añadido a $fichero_registro"

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ ./registra.sh Copia de seguridad terminada
#   Mensaje añadido a /home/ana/ut2/ejercicios/registro.log
#   $ ./registra.sh "Reinicio del servicio ssh"
#   Mensaje añadido a /home/ana/ut2/ejercicios/registro.log
#   $ tail registro.log
#   2026-10-20 09:20:13 [ana] Copia de seguridad terminada
#   2026-10-20 09:21:40 [ana] Reinicio del servicio ssh
# --------------------------------------------------------------
