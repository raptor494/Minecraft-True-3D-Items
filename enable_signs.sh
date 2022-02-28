#!/bin/bash
for wood_type in oak birch spruce jungle acacia dark_oak crimson warped iron; do
	file=assets/minecraft/models/item/${wood_type}_sign.json.disabled
	if [ -a "$file" ]; then
		mv "$file" assets/minecraft/models/item/${wood_type}_sign.json
	fi
done
