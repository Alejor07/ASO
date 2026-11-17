#!/bin/bash
# ==============================================================
# Nombre:      contar.sh  (corregido)
# Ejercicio:   7.1 - Errores de sintaxis
# Descripción: Cuenta los ficheros y directorios de una ruta (la
#              carpeta actual si no se indica ninguna).
# Uso:         ./contar.sh [RUTA]
#
# ERRORES CORREGIDOS (ambos de SINTAXIS, los detecta bash -n):
#   1. Línea 10: faltaba ; antes de then  →  elif [ -d "$e" ]; then
#      bash -n avisa en la línea 12: «syntax error near unexpected
#      token `fi'». Bash se da cuenta del problema al llegar al fi.
#   2. Línea 15: faltaban las comillas de cierre al final del echo.
#      Solo aparece al corregir el primero. bash -n avisa en la línea 15
#      con «unexpected EOF while looking for matching `"'» (ha llegado
#      al final del fichero buscando las comillas de cierre).
#   NOTA: el mensaje no siempre señala la línea donde está el error:
#         hay que mirar también las líneas anteriores.
# ==============================================================

# Ruta que se revisa: el primer argumento o, si no hay, «.» (la carpeta actual).
ruta=${1:-.}

ficheros=0
directorios=0

# NOTA: "$ruta"/* es la lista de todo lo que hay dentro de la ruta.
#       El for la recorre con la variable elemento.
for elemento in "$ruta"/*; do
    if [ -f "$elemento" ]; then
        ficheros=$((ficheros + 1))
    # CORREGIDO: faltaba el ; antes de then.
    elif [ -d "$elemento" ]; then
        directorios=$((directorios + 1))
    fi
done

# CORREGIDO: faltaban las comillas de cierre.
echo "En $ruta hay $ficheros ficheros y $directorios directorios"

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ bash -n contar.sh          (no muestra nada: sintaxis correcta)
#   $ ./contar.sh /etc
#   En /etc hay 98 ficheros y 107 directorios
# NOTA: en la versión original la variable se llamaba «e». Le hemos
#       puesto un nombre descriptivo; no cambia el funcionamiento.
# --------------------------------------------------------------
