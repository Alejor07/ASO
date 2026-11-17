#!/bin/bash
# ==============================================================
# Nombre:      resumen.sh
# Ejercicio:   2.4 - Sustitución de comandos
# Descripción: Guarda datos del sistema en variables y los muestra
#              en tres frases.
# Uso:         ./resumen.sh
# ==============================================================

# NOTA: $(comando) ejecuta el comando y guarda en la variable lo que
#       ese comando mostraría en pantalla.

# Tu usuario.
usuario=$(whoami)
# RESULTADO: usuario vale «ana»

# El nombre del equipo.
equipo=$(hostname)
# RESULTADO: equipo vale «SRVUBASO»

# La fecha y la hora con el formato 20/10/2026 a las 09:15
# NOTA: %d = día, %m = mes, %Y = año con 4 cifras, %H = hora, %M = minutos.
#       El texto «a las» se copia tal cual. Las comillas simples son
#       necesarias porque el formato tiene espacios.
fecha=$(date '+%d/%m/%Y a las %H:%M')
# RESULTADO: fecha vale «20/10/2026 a las 09:15»

# El número de procesos en ejecución.
# NOTA: ps -e lista todos los procesos, uno por línea; --no-headers quita
#       la línea de títulos. La tubería | pasa esa lista a wc -l, que
#       cuenta las líneas.
procesos=$(ps -e --no-headers | wc -l)
# RESULTADO: procesos vale, por ejemplo, «112»

# La versión del kernel (el núcleo de Linux).
kernel=$(uname -r)
# RESULTADO: kernel vale, por ejemplo, «6.17.0-5-generic»

# Mostrar el resumen.
echo "Hola, $usuario. Estás conectado al equipo $equipo."
echo "Hoy es $fecha."
echo "Hay $procesos procesos en ejecución y el kernel es la versión $kernel."

# --------------------------------------------------------------
# EJEMPLO DE EJECUCIÓN
#   $ ./resumen.sh
#   Hola, ana. Estás conectado al equipo SRVUBASO.
#   Hoy es 20/10/2026 a las 09:15.
#   Hay 112 procesos en ejecución y el kernel es la versión 6.17.0-5-generic.
# --------------------------------------------------------------
