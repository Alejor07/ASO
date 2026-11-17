#!/bin/bash
# ==============================================================
# Nombre:      servicios.sh  (versión del ejercicio 6.1)
# Ejercicio:   6.1 - Recorrer una lista
# Descripción: Muestra el estado de los servicios ssh, cron, rsyslog y
#              apache2 y cuenta cuántos están activos.
# Uso:         ./servicios.sh
# NOTA:        En el ejercicio 8.2 se amplía con cabecera, ayuda -h y
#              servicios como argumentos (ver bloque8/servicios_8.2.sh).
# ==============================================================

# Contador de servicios activos: empieza en 0, ANTES del bucle.
activos=0

# NOTA: for repite el bloque entre do y done una vez por cada palabra
#       de la lista. En cada vuelta, la variable servicio toma el valor
#       siguiente: ssh, luego cron, luego rsyslog y por último apache2.
for servicio in ssh cron rsyslog apache2; do
    # NOTA: systemctl is-active muestra una palabra: «active» si el
    #       servicio está en marcha, «inactive» si no lo está, «failed»
    #       si ha fallado…
    estado=$(systemctl is-active "$servicio")

    # NOTA: %-10s = nombre del servicio en 10 posiciones, a la izquierda,
    #       para que los estados queden alineados en columna.
    printf "%-10s %s\n" "$servicio" "$estado"

    # NOTA: = compara TEXTOS. Si está activo, sumamos 1 al contador.
    if [ "$estado" = "active" ]; then
        activos=$((activos + 1))
    fi
done

# Se muestra DESPUÉS del done, cuando ya se han revisado todos.
echo "Servicios activos: $activos de 4"

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ ./servicios.sh
#   ssh        active
#   cron       active
#   rsyslog    active
#   apache2    inactive
#   Servicios activos: 3 de 4
# NOTA: apache2 sale «inactive» si no está instalado.
# --------------------------------------------------------------
