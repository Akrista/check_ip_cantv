#! /bin/bash

last_ip=$(cat ./.public_ip)
recent_ip=$(wget -qO - icanhazip.com)
ip_has_changed="El servidor ha cambiado su IP a {$recent_ip}"

#echo "Revisando IP Publica"
#sleep 1
if [[ $last_ip == $recent_ip ]] && [[ -n $recent_ip ]]; then
    echo "La IP Publica "+=" no ha cambiado"
    # sleep 0
elif [[ $last_ip != $recent_ip ]] && [[ -n $recent_ip ]]; then
    echo "La IP Publica "+=" ha cambiado"
    echo $recent_ip >./.public_ip
    # bash ./discord.sh --webhook-url="$WEBHOOK" --text "{$ip_has_changed}"
else
    echo "No hay IP Publica"
fi

#wget -qO - icanhazip.com
