#!/bin/bash

echo "Ingrese el nombre de la ciudad de la cual quiere saber la temperatura actual"
read -p "Ciudad: " ciudad

apikey="3a1e4635627546b8ad8190525242306"
ciudad_encoded=$(echo "$ciudad" | sed 's/ /%20/g')
url="http://api.weatherapi.com/v1/current.json?q=${ciudad_encoded}&key=${apikey}"

respuesta=$(curl -s $url)

if echo "$respuesta" | jq -e '.error' > /dev/null; then
    echo "No se encontro datos para la ciudad ingresada."
else
    temp=$(echo "$respuesta" | jq '.current.temp_c')
    echo "La temperatura en $ciudad es ${temp}°C"
fi