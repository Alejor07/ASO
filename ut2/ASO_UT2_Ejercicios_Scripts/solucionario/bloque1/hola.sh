#!/bin/bash
# ==============================================================
# Nombre:      hola.sh
# Ejercicio:   1.6 - Primer script
# Descripción: Saluda al usuario y muestra el día y el equipo.
# Uso:         ./hola.sh
# ==============================================================

# NOTA: $USER es una variable de entorno: el sistema la crea al iniciar
#       sesión y contiene tu nombre de usuario. No hay que definirla.
# NOTA: $(date +%A) ejecuta el comando date y pone su resultado dentro
#       del texto. %A significa «nombre del día de la semana».
echo "Hola, $USER. Hoy es $(date +%A)."
# RESULTADO: Hola, ana. Hoy es Monday.
# NOTA: el día sale en inglés si la máquina virtual está configurada en
#       inglés (lo habitual en Ubuntu Server).

# NOTA: hostname muestra el nombre del equipo en el que se EJECUTA el
#       script. Con VS Code en remoto, es la máquina virtual, no tu equipo.
echo "Estás en el equipo $(hostname)."
# RESULTADO: Estás en el equipo SRVUBASO.

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ chmod u+x hola.sh
#   $ ./hola.sh
#   Hola, ana. Hoy es Monday.
#   Estás en el equipo SRVUBASO.
# --------------------------------------------------------------
