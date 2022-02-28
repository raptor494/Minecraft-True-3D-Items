#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Missing argument 1: base directory of extracted Minecraft textures"
    exit 1
fi
if [ $# -gt 1 ]; then
    echo "Too many arguments given"
    exit 1
fi
source_folder=$1/assets/minecraft/textures/block
if [ ! -d "$source_folder" ]; then
    echo "$source_folder is either missing or not a directory"
    exit 1
fi
mkdir --parents assets/true3d/textures/item
for wood_type in oak birch spruce jungle acacia dark_oak crimson warped; do
    img_top=$source_folder/${wood_type}_door_top.png
    img_bottom=$source_folder/${wood_type}_door_bottom.png
    if [ -e "$img_top" -a -e "$img_bottom" ]; then
        magick convert -background none \( -layers flatten "$img_top" -repage 32x32+8+0 \) \( -layers flatten "$img_bottom" -repage 32x32+8+16 \) -composite assets/true3d/textures/item/${wood_type}_door.png
    fi
done