#!/bin/bash

echo "🔧 Creo cartelle..."
mkdir -p models/diffusion_models

echo "⬇️ Scarico il modello Chroma..."
wget -nc -O models/diffusion_models/chroma-unlocked-v36.safetensors \
  "https://huggingface.co/lodestones/Chroma/resolve/main/chroma-unlocked-v36.safetensors"

echo "🚀 Avvio ComfyUI..."
cd ComfyUI
python3 main.py --listen --port 8188
