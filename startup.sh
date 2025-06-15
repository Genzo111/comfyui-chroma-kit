#!/bin/bash

echo "✅ Avvio ComfyUI con Chroma..."

# Crea cartelle necessarie nel volume
mkdir -p /workspace/ComfyUI/models/diffusion_models

# Scarica Chroma v37 se non presente
if [ "$DOWNLOAD_CHROMA" = "true" ] && [ ! -f /workspace/ComfyUI/models/diffusion_models/chroma-unlocked-v37.safetensors ]; then
  echo "⬇️ Scarico Chroma v37..."
  wget -O /workspace/ComfyUI/models/diffusion_models/chroma-unlocked-v37.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v37.safetensors"
fi

# Avvia ComfyUI da volume
cd /workspace/ComfyUI
python3 main.py
