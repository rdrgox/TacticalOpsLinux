#!/bin/bash

label="Tactical Ops: Assault On Terror 3.5 for Linux v469d"


echo -e "\n
████████╗ █████╗  ██████╗████████╗██╗ ██████╗ █████╗ ██╗          ██████╗ ██████╗ ███████╗
╚══██╔══╝██╔══██╗██╔════╝╚══██╔══╝██║██╔════╝██╔══██╗██║         ██╔═══██╗██╔══██╗██╔════╝ 
   ██║   ███████║██║        ██║   ██║██║     ███████║██║         ██║   ██║██████╔╝███████╗
   ██║   ██╔══██║██║        ██║   ██║██║     ██╔══██║██║         ██║   ██║██╔═══╝ ╚════██║
   ██║   ██║  ██║╚██████╗   ██║   ██║╚██████╗██║  ██║███████╗    ╚██████╔╝██║     ███████║
   ╚═╝   ╚═╝  ╚═╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═╝     ╚══════╝
                                                                                                                                                                                               
"

# ruta del Script
script_dir="$(dirname "$(realpath "$0")")"

# busca comprimido en el directorio
to_v469d=$(find "$script_dir" -maxdepth 1 -type f -name "TO-Fixed-Pack-v469d.tar.xz" | head -n 1)

# busca comprimido TOFP469d-LinuxFiles.tar.xzen el directorio
linux_files=$(find "$script_dir" -maxdepth 1 -type f -name "TOFP469d-LinuxFiles.tar.xz" | head -n 1)

function ctrl_c(){
    echo -e "\n[!] Saliendo...\n"
    exit 1
}

# ctrl+c
trap ctrl_c SIGINT

# Verificar si se encontró algún archivo .tar
if [[ -n "$to_v469d" ]]; then
    # Extraer el nombre de la carpeta interna
    internal_dir=$(tar -tf "$to_v469d" | head -n 1 | cut -d '/' -f 1)

    # Verificar si la carpeta interna no está vacía
    if [[ -n "$internal_dir" ]]; then

        # Extraer solo el contenido de la carpeta interna en el directorio Home
        tar -xf "$to_v469d" -C "$HOME" --strip-components=1 "$internal_dir"
        echo "El contenido de la carpeta $internal_dir en $to_v469d ha sido descomprimido en el directorio $HOME"
    else
        echo "No se encontró ninguna carpeta interna en $to_v469d."
    fi
else
    echo "No se encontró ningún archivo .tar en el directorio del script."
fi

if [[ -n "$linux_files" ]]; then
    # Extraer el nombre de la carpeta interna
    internal_dir2=$(tar -tf "$linux_files" | head -n 1 | cut -d '/' -f 1)

    # Verificar si la carpeta interna no está vacía
    if [[ -n "$internal_dir2" ]]; then
        # Extrae solo el contenido de la carpeta interna en el directorio Home sin sobrescribir archivos existentes
        tar --skip-old-files -xf "$linux_files" -C "$HOME" --strip-components=1 "$internal_dir2"
        echo "El contenido de la carpeta $internal_dir2 en $linux_files ha sido descomprimido en el directorio $HOME"
    else
        echo "No se encontró ninguna carpeta interna en $linux_files."
    fi
else
    echo "No se encontró ningún archivo Carpeta2.tar en el directorio del script."
fi

chmod +x "$HOME"/TacticalOps/TO350/System/TacticalOps.sh