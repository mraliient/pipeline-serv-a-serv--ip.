#!/bin/bash

SOURCE_IP="$1"
SOURCE_DIR="$2"
DEST_IP="$3"
DEST_DIR="$4"
PORT="${5:-22}"  # Usa el puerto 22 por defecto si no se especifica

echo "Iniciando transferencia de archivos..."
echo "Desde: $SOURCE_IP:$SOURCE_DIR"
echo "Hacia: $DEST_IP:$DEST_DIR"
echo "Puerto: $PORT"

# Simulación de transferencia (reemplazar por sftp/scp real)
echo "Simulando transferencia de archivos por SFTP/SSH"
sleep 2
echo "Transferencia completada."
