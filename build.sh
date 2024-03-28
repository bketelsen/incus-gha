#!/bin/bash

source="recipes"
output="result"

shopt -s dotglob

for file in "$source"/*.yaml; do
    if [ -f "$file" ]; then
        echo found "$file"
        outdir=$output/$(basename "$file" .yaml)
        echo "$outdir"
        sudo distrobuilder build-incus "$file" "$outdir"
        
    fi
done