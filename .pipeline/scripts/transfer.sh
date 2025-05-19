#!/bin/bash

SOURCE_IP="$1"
SOURCE_DIR="$2"
DEST_IP="$3"
DEST_DIR="$4"
USERNAME="$5"
PASSWORD="$6"
PORT="$7"

echo "Iniciando transferencia por SFTP..."
echo "Desde: $SOURCE_IP:$SOURCE_DIR"
echo "Hacia: $DEST_IP:$DEST_DIR"
echo "Puerto: $PORT"

# Instalar lftp si no está disponible
if ! command -v lftp &> /dev/null; then
  echo "lftp no está instalado. Instalando..."
  sudo apt-get update && sudo apt-get install -y lftp
fi

# Ejecutar transferencia
lftp -u "$USERNAME","$PASSWORD" sftp://$SOURCE_IP:$PORT <<EOF
mirror --reverse --verbose "$SOURCE_DIR" sftp://$DEST_IP:$PORT/$DEST_DIR
EOF

echo "Transferencia completada."
