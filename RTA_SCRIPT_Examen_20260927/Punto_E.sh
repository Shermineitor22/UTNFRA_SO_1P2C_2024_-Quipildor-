#!/bin/bash
# Script Punto E - Filtros Basicos

# 1. Crear o asegurar el directorio de salida directamente
DIR_SALIDA="RTA_ARCHIVOS_Examen_2024"
mkdir -p "$DIR_SALIDA"

ARCH_DESTINO="$DIR_SALIDA/Filtro_Basico.txt"

# 2. Filtrar la memoria RAM total
grep "MemTotal:" /proc/meminfo > "$ARCH_DESTINO"

# 3. Filtrar el fabricante del chassis con dmidecode
sudo dmidecode -t chassis | grep -E "Chassis Information|Manufacturer:" >> "$ARCH_DESTINO"

echo "Punto E completado correctamente."
