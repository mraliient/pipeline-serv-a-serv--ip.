#!/bin/bash

# Parámetros
SOURCE_IP="$1"
SOURCE_DIR="$2"
DEST_IP="$3"
DEST_DIR="$4"
PORT="$5"
PASSWORD="$6"

# Mostrar información
echo "Iniciando transferencia de archivos..."
echo "Desde: $SOURCE_IP:$SOURCE_DIR"
echo "Hacia: $DEST_IP:$DEST_DIR"
echo "Puerto: $PORT"

# Verifica que sshpass esté instalado
if ! command -v sshpass &> /dev/null; then
  echo "Error: sshpass no está instalado. Instálalo antes de ejecutar este script."
  exit 1
fi

# Ejecutar la transferencia con scp
SSHPASS="$PASSWORD" sshpass -e scp -P "$PORT" -o StrictHostKeyChecking=no -r "$SOURCE_IP:$SOURCE_DIR" "$DEST_IP:$DEST_DIR"

# Verificar estado
if [ $? -eq 0 ]; then
  echo "✅ Transferencia completada con éxito."
else
  echo "❌ Error en la transferencia."
  exit 1
fi
