#! /bin/bash

last_ip=$(cat ./.public_ip)
recent_ip=$(wget -qO - icanhazip.com)

#echo "Revisando IP Publica"
#sleep 1
if [[ $last_ip == $recent_ip ]]; then
    echo "La IP Publica "+=" no ha cambiado"
elif [[ $last_ip != $recent_ip ]]; then
    echo "La IP Publica "+=" ha cambiado"
    echo $recent_ip >./.public_ip
else
    echo "No hay IP Publica"
fi

#wget -qO - icanhazip.com
