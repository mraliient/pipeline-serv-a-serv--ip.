#!/bin/bash

# Parámetros
SOURCE_USER="$1"
SOURCE_IP="$2"
SOURCE_PORT="$3"
SOURCE_DIR="$4"

DEST_USER="$5"
DEST_IP="$6"
DEST_PORT="$7"
DEST_DIR="$8"

PASSWORD="$9"

echo "Iniciando transferencia de archivos..."
echo "Desde: $SOURCE_USER@$SOURCE_IP:$SOURCE_DIR (puerto $SOURCE_PORT)"
echo "Hacia: $DEST_USER@$DEST_IP:$DEST_DIR (puerto $DEST_PORT)"

# Transferencia usando sshpass + scp por el puerto indicado
sshpass -p "$PASSWORD" scp -P "$SOURCE_PORT" -o StrictHostKeyChecking=no -r "$SOURCE_USER@$SOURCE_IP:$SOURCE_DIR" "$DEST_USER@$DEST_IP:$DEST_DIR"

if [ $? -eq 0 ]; then
  echo "Transferencia completada con éxito."
else
  echo "Error en la transferencia."
  exit 1
fi
