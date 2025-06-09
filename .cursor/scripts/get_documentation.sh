#!/bin/bash

# =============================================================
# Script: get_descriptions.sh
# Descripción:
#   Extrae las descripciones de modelos a partir de archivos Ruby.
#   Busca comentarios con la etiqueta @description al inicio de cada archivo.
#
# Uso:
#   ./get_descriptions.sh archivo1.rb carpeta1 archivo2.rb carpeta2 ...
#
#   Puedes pasar uno o más archivos y/o carpetas como argumentos.
#   Si pasas una carpeta, el script procesará todos los archivos dentro de ella recursivamente.
#
# Ejemplos:
#   1. Procesar una carpeta completa:
#      ./get_descriptions.sh app/models
#
#   2. Procesar varios archivos específicos:
#      ./get_descriptions.sh app/models/user.rb app/models/role.rb
#
#   3. Mezclar archivos y carpetas:
#      ./get_descriptions.sh app/models app/other_models/modelo.rb
#
#   4. Usar con rutas relativas o absolutas:
#      ./get_descriptions.sh ./app/models /ruta/completa/a/modelo.rb
# =============================================================

if [ $# -eq 0 ]; then
  echo "Debes especificar al menos un archivo o carpeta."
  exit 1
fi

# Construir la lista de archivos a procesar
files=()
for path in "$@"; do
  if [ -d "$path" ]; then
    # Elimina la barra final si existe
    dir_path="${path%/}"
    while IFS= read -r -d $'\0' file; do
      # Normaliza la ruta eliminando dobles barras
      clean_file=$(echo "$file" | sed 's://*:/:g')
      files+=("$clean_file")
    done < <(find "$dir_path" -type f -print0)
  elif [ -f "$path" ]; then
    clean_file=$(echo "$path" | sed 's://*:/:g')
    files+=("$clean_file")
  else
    echo "Advertencia: '$path' no es un archivo ni una carpeta válida."
  fi
done

for file in "${files[@]}"; do
  block=""
  found=0
  while IFS= read -r line; do
    if [[ $line =~ ^# ]]; then
      clean_line=$(echo "$line" | sed -E 's/^# ?//')
      # Elimina '@description' si está al inicio de la línea
      clean_line=$(echo "$clean_line" | sed -E 's/^@description[ ]*//I')
      if [[ $line =~ ^#\ ?@description ]]; then
        found=1
        block="$clean_line\n"
      elif [[ $found -eq 1 ]]; then
        if [[ $clean_line =~ ^@ ]]; then
          break
        fi
        block+="$clean_line\n"
      fi
    elif [[ $found -eq 1 ]]; then
      break
    fi
  done < "$file"

  echo "========================================="
  echo "Archivo: $file"
  if [[ $found -eq 1 ]]; then
    echo "Descripción:"
    echo -e "$block" | sed 's/^/  /'
  else
    echo "Descripción: None"
  fi
  echo "========================================="
  echo
done