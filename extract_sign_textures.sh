#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Missing argument 1: base directory of extracted Minecraft textures"
    exit 1
fi
if [ $# -gt 1 ]; then
    echo "Too many arguments given"
    exit 1
fi
source_folder=$1/assets/minecraft/textures/entity/signs
if [ ! -d "$source_folder" ]; then
    echo "$source_folder is either missing or not a directory"
    exit 1
fi
mkdir --parents assets/true3d/textures/block
for wood_type in oak birch spruce jungle acacia dark_oak crimson warped; do
    img=$source_folder/$wood_type.png
    if [ -a "$img" ]; then
        magick "$img" \( +clone -crop 24x12+2+2 -size 32x32 canvas:none +swap -composite \) \( -clone 0 -crop 24x12+28+2 -size 32x32 canvas:none +swap -composite \) -delete 0 -geometry +0+12 -composite assets/true3d/textures/block/${wood_type}_sign.png
    fi
done