#!/bin/bash
# Este script es para particionar el disco /dev/sdb (10GB) en 10 particiones

DISCO="/dev/sdb"

sudo fdisk $DISCO <<EOF
o
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
e


n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n

+1G
n


w
EOF

echo "Particionamiento en /dev/sdb completado."
