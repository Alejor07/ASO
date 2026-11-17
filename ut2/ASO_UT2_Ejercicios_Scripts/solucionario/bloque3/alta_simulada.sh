#!/bin/bash
# ==============================================================
# Nombre:      alta_simulada.sh
# Ejercicio:   3.2 - Pedir datos con read
# Descripción: Pide los datos de una cuenta nueva y muestra un resumen
#              sin enseñar la contraseña. No crea ninguna cuenta.
# Uso:         ./alta_simulada.sh
# ==============================================================

# NOTA: read espera a que escribas algo y pulses Intro, y lo guarda en
#       la variable indicada al final.
#       -p "texto" muestra ese texto antes de esperar (el «prompt»).
#       -r hace que la barra \ se guarde tal cual (buena costumbre).
read -r -p "Nombre de usuario: " usuario
read -r -p "Departamento: " departamento

# NOTA: -s (silencioso) hace que lo que escribes NO aparezca en pantalla.
read -r -s -p "Contraseña: " clave

# NOTA: con -s, al pulsar Intro tampoco se ve el salto de línea.
#       Este echo vacío lo añade para que el resumen empiece en otra línea.
echo

echo "Resumen del alta:"
echo "  Usuario:      $usuario"
echo "  Departamento: $departamento"
# NOTA: ${#clave} es el NÚMERO DE CARACTERES de la variable clave.
#       Así comprobamos la contraseña sin mostrarla.
echo "  Contraseña:   ${#clave} caracteres"

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ ./alta_simulada.sh
#   Nombre de usuario: lmartin
#   Departamento: Contabilidad
#   Contraseña:                   (lo que escribes no se ve)
#   Resumen del alta:
#     Usuario:      lmartin
#     Departamento: Contabilidad
#     Contraseña:   9 caracteres
# --------------------------------------------------------------
