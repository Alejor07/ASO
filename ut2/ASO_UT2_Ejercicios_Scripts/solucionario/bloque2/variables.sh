#!/bin/bash
# ==============================================================
# Nombre:      variables.sh
# Ejercicio:   2.1 - Asignar y usar variables
# Descripción: Define tres variables y construye con ellas el nombre
#              de un fichero de log y el de una copia de seguridad.
# Uso:         ./variables.sh
# ==============================================================

# Asignación de variables.
# NOTA: SIN espacios alrededor del =. Ver el ERROR 1 al final.
servidor="web01"
puerto=22
entorno="producción"

# Mostrar las variables.
# NOTA: para LEER una variable se pone $ delante; para asignarla, no.
echo "Servidor: $servidor"
# RESULTADO: Servidor: web01
echo "Puerto:   $puerto"
# RESULTADO: Puerto:   22
echo "Entorno:  $entorno"
# RESULTADO: Entorno:  producción

# Nombre del fichero de log: el servidor seguido de _acceso.log
# NOTA: las llaves ${servidor} marcan dónde termina el nombre de la
#       variable. Sin ellas, Bash buscaría una variable llamada
#       «servidor_acceso». Ver el ERROR 2 al final.
fichero_log="${servidor}_acceso.log"
echo "Log:      $fichero_log"
# RESULTADO: Log:      web01_acceso.log

# Nombre de la copia: el servidor, un guion, la fecha y .tar.gz
# NOTA: date +%Y-%m-%d muestra la fecha como año-mes-día (2026-10-20).
fecha=$(date +%Y-%m-%d)
fichero_copia="${servidor}-${fecha}.tar.gz"
echo "Copia:    $fichero_copia"
# RESULTADO: Copia:    web01-2026-10-20.tar.gz

# --------------------------------------------------------------
# ERRORES PROVOCADOS A PROPÓSITO (no forman parte del script)
#
# ERROR 1: asignación con espacios
#   servidor = "web01"
# RESULTADO: ./variables.sh: line N: servidor: command not found  (N = la línea del error)
# NOTA: con espacios, Bash entiende que «servidor» es un COMANDO y que
#       «=» y «web01» son sus argumentos. Ese comando no existe.
#
# ERROR 2: nombre del log sin llaves
#   echo "Log: $servidor_acceso.log"
# RESULTADO: Log: .log
# NOTA: el guion bajo puede formar parte del nombre de una variable,
#       así que Bash busca la variable «servidor_acceso». Como no existe,
#       vale vacío y solo queda «.log». No da ningún mensaje de error:
#       es un error de LÓGICA.
# --------------------------------------------------------------

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ ./variables.sh
#   Servidor: web01
#   Puerto:   22
#   Entorno:  producción
#   Log:      web01_acceso.log
#   Copia:    web01-2026-10-20.tar.gz
# --------------------------------------------------------------
