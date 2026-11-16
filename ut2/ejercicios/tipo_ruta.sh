#!/bin/bash
if [ "$#" -ne "1" ] ; then
echo "Error"
else 

if  [[ -e "$1" ]] ; then

if [ -f "$1" ] ; then

stat -c "%s bytes" "$1"

elif [ -d "$1" ] ; then
echo "$1 es un directorio"

else 
echo "$1 es otro tipo de elemento" 

fi
ls -al $1
else
echo "Archivo no existente"

fi

fi