#!/bin/bash
Usuario=$(whoami)
Equipo=$(hostname)
Fecha=$(date +%Y-%m-%d)
Hora=$(date "+%H:%M:%S")
Procesos=$(ps -e --no-headers | wc -l)
Kernel=$(uname -r)
echo "Tu usuario es $Usuario, estas en un $equipo con fecha de $Fecha a las $Hora, hay $Procesos en ejecucion y tienes una version de kernel de $Kernel " 