#!/bin/bash
echo -n "Instalar programa? [s/n]: "
read resultado

if [[ $resultado == [sS] ]]; then
    echo "Instalando programa..."
elif [[ $resultado == [nN] ]]; then
    echo "El programa no se va a instalar"
else
    echo "Opcion invalida"
fi
echo ""
echo -n "Escribe un número: "
read valor

if [[ $valor -ne 5 ]]; then
    echo "Tu numero no es igual a 5"
else
    echo "Tu numero es igual a 5"
fi
echo ""
echo -n "Escribe un número: "
read valor

if [ $valor -lt 5 -o $valor -gt 10 ]; then
    echo "Tu numero está fuera  del rango [5, 10]"
else
    echo "Tu numero está en el rango [5, 10]"
fi

echo ""
echo -n "Escribe un número: "
read limite

for (( i = 0; i < $limite; i++ )); do
    (( c = $i + 1 )) 
    echo $c
done
# Parametros
echo $1 #al imprimir tienes que poner ./script.sh argumento
#Existencia de directorios y ficheros -d -f
if [ ! -d $1 ]; then
    echo "Error: el directorio no existe"
    exit 1
fi

total=0
for f in `ls $1`; do
    name="$1/$f"
    if [ -f $name ]; then
        bytes=`ls -l $name | cut -d " " -f 5`
        echo "Fichero $name ocupa $bytes" | tr -s /
        (( total = $total + $bytes ))
    fi
done
echo -e "\nTotal: $total"