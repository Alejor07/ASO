#!/BIN/BASH
usuarios=$(awk -F: '$3 >= 1000 && $1 != "nobody" {count++} END {print count+0}' /etc/passwd)
for cuentas in $usuarios do
echo "Cuentas de personas: $cuentas "



echo "Total: $numero cuentas de personas y $sistema del sistema"
done
