#!/bin/bash

SOURCE_IP="$1"
SOURCE_DIR="$2"
DEST_IP="$3"
DEST_DIR="$4"

echo "Iniciando transferencia de archivos..."
echo "Desde: $SOURCE_IP:$SOURCE_DIR"
echo "Hacia: $DEST_IP:$DEST_DIR"

# Simulación
echo "Simulando transferencia"
sleep 2
echo "Transferencia completada."
