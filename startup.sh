#!/bin/bash

set -e  # Termina in caso di errore

echo "🚀 Avvio setup ComfyUI..."

# Installa curl e git se mancano
apt update && apt install -y curl git

# Clona ComfyUI se non già presente
if [ ! -d "ComfyUI" ]; then
  echo "📁 Clonazione ComfyUI..."
  git clone https://github.com/comfyanonymous/ComfyUI.git
fi

cd ComfyUI

# Crea la cartella per i modelli
mkdir -p models/diffusion_models

# Scarica Chroma v37 se richiesto
if [ "$DOWNLOAD_CHROMA" = "true" ]; then
  echo "⬇️ Scarico Chroma v37..."
  curl -L -o models/diffusion_models/chroma-unlocked-v37.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v37.safetensors"
fi

# Installa i requirements
echo "📦 Installazione requirements..."
pip install -r requirements.txt

# Avvia ComfyUI
echo "🟢 Avvio ComfyUI sulla porta 8188..."
python3 main.py --listen --port 8188
