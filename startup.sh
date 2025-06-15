#!/bin/bash

# Vai nella cartella principale della Pod
cd /workspace

# Clona ComfyUI se non esiste già
if [ ! -d "ComfyUI" ]; then
  echo "Clonazione ComfyUI..."
  git clone https://github.com/comfyanonymous/ComfyUI.git
fi

# Scarica Chroma se richiesto
if [[ "$DOWNLOAD_CHROMA" == "true" ]]; then
  echo "Download del modello Chroma..."
  mkdir -p ComfyUI/models/diffusion_models/
  wget -nc -O ComfyUI/models/diffusion_models/chroma-unlocked-v37.safetensors \
    "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v36.safetensors"
fi

# Avvia ComfyUI
cd ComfyUI
echo "Avvio ComfyUI sulla porta 8188..."
python3 main.py --listen --port 8188
