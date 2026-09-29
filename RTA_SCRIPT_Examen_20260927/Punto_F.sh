#!/bin/bash
# Script Punto F - Filtro Avanzado de Red y Usuario

# 1. Definir carpeta y archivo de destino
DIR_SALIDA="RTA_ARCHIVOS_Examen_2024"
mkdir -p "$DIR_SALIDA"
ARCH_DESTINO="$DIR_SALIDA/Filtro_Avanzado.txt"

# 2. Obtener la IP publica (usando curl)
IP_PUB=$(curl -s ifconfig.me)

# 3. Obtener el usuario actual
USUARIO=$(whoami)

# 4. Obtener el Hash de la clave desde /etc/shadow 
HASH_CLAVE=$(sudo grep "^${USUARIO}:" /etc/shadow | awk -F':' '{print $2}')

# 5. Escribir los resultados en el archivo
echo "Mi IP Publica es: $IP_PUB" > "$ARCH_DESTINO"
echo "Mi usuario es: $USUARIO" >> "$ARCH_DESTINO"
echo "El Hash de mi usuario es: $HASH_CLAVE" >> "$ARCH_DESTINO"

echo "Punto F completado correctamente."
