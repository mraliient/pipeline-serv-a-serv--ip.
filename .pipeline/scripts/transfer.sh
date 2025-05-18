#!/bin/bash

SOURCE_IP="$1"
SOURCE_DIR="$2"
DEST_IP="$3"
DEST_DIR="$4"
PORT="$5"
PASSWORD="$6"

echo "Iniciando transferencia por SFTP..."
echo "Desde: $SOURCE_IP:$SOURCE_DIR"
echo "Hacia: $DEST_IP:$DEST_DIR"

sshpass -p "$PASSWORD" sftp -oStrictHostKeyChecking=no -P $PORT $DEST_IP <<EOF
  put -r $SOURCE_DIR/* $DEST_DIR/
  bye
EOF

echo "Transferencia completada."
