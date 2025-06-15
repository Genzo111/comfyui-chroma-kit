#!/bin/bash

# Imposta working directory
cd /workspace

# Clona ComfyUI solo se non esiste
if [ ! -d "ComfyUI" ]; then
  git clone https://github.com/comfyanonymous/ComfyUI.git
fi

# Scarica Chroma se richiesto
if [ "$DOWNLOAD_CHROMA" = "true" ]; then
  mkdir -p ComfyUI/models/diffusion_models/
  wget -nc -O ComfyUI/models/diffusion_models/chroma-unlocked-v36.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v36.safetensors"
fi

# Avvia ComfyUI
cd ComfyUI
python3 main.py --listen --port 8188
