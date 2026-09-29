#!/bin/bash
# Script para la creacion de grupos, usuarios, asignacion de permisos y validacion

# 1. Obtener la clave encriptada (hash) del usuario actual (vagrant)
CLAVE_HASH=$(sudo grep "^$USER:" /etc/shadow | awk -F':' '{print $2}')

# 2. Crear los grupos secundarios exigidos
sudo groupadd -f p1c2_2024_gAlumno
sudo groupadd -f p1c2_2024_gProfesores

# 3. Crear los usuarios con su grupo primario predeterminado, asignando el grupo secundario y la clave hash
sudo useradd -m -s /bin/bash -p "$CLAVE_HASH" -G p1c2_2024_gAlumno p1c2_2024_A1
sudo useradd -m -s /bin/bash -p "$CLAVE_HASH" -G p1c2_2024_gAlumno p1c2_2024_A2
sudo useradd -m -s /bin/bash -p "$CLAVE_HASH" -G p1c2_2024_gAlumno p1c2_2024_A3
sudo useradd -m -s /bin/bash -p "$CLAVE_HASH" -G p1c2_2024_gProfesores p1c2_2024_P1

# 4. Ajustar propietarios, grupos y permisos para cada carpeta
sudo chown -R p1c2_2024_A1:p1c2_2024_A1 /Examenes-UTN/alumno_1
sudo chmod -R 750 /Examenes-UTN/alumno_1

sudo chown -R p1c2_2024_A2:p1c2_2024_A2 /Examenes-UTN/alumno_2
sudo chmod -R 760 /Examenes-UTN/alumno_2

sudo chown -R p1c2_2024_A3:p1c2_2024_A3 /Examenes-UTN/alumno_3
sudo chmod -R 700 /Examenes-UTN/alumno_3

sudo chown -R p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod -R 775 /Examenes-UTN/profesores

# 5. Generar los archivos validar.txt mediante ejecucion de whoami con cada usuario
sudo su -c "whoami > /Examenes-UTN/alumno_1/validar.txt" p1c2_2024_A1
sudo su -c "whoami > /Examenes-UTN/alumno_2/validar.txt" p1c2_2024_A2
sudo su -c "whoami > /Examenes-UTN/alumno_3/validar.txt" p1c2_2024_A3
sudo su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1

echo "Punto C completado correctamente."
