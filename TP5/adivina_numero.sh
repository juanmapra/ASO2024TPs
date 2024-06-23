#!/bin/bash

numero=$(( RANDOM % 100 + 1 ))
intentos=8

echo "Adivina el numero en el que estoy pensando"
echo "Tienes $intentos intentos!"

while [ $intentos -gt 0 ]; do
    read -p "El numero que estoy pensando es: " adivina

    if [ "$adivina" -eq "$numero" ]; then
        echo "Genial, has adivinado el numero!"
        exit 0
    elif [ "$adivina" -gt "$numero" ]; then
        echo "El numero en el que estoy pensando es mas bajo"
    else
        echo "El numero en el que estoy pensando es mas alto"
    fi

    intentos=$((intentos - 1))
    echo "Te quedan $intentos intentos"

    if [ $intentos -eq 0 ]; then
        echo "Ya no te quedan intentos"
        echo "El numero en el que estaba pensando era $numero"
        exit 0
    fi

done