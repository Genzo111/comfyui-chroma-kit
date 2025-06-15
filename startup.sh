#!/bin/bash

echo "✅ Avvio ComfyUI con Chroma..."

# Crea le cartelle per il modello se non esistono
mkdir -p ComfyUI/models/diffusion_models

# Scarica Chroma v37 se richiesto (variabile di ambiente)
if [ "$DOWNLOAD_CHROMA" = "true" ]; then
  echo "⬇️ Scarico Chroma v37..."
  curl -L -o ComfyUI/models/diffusion_models/chroma-unlocked-v37.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v37.safetensors"
fi

# Avvia ComfyUI
cd ComfyUI
python main.py
