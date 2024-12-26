#!/bin/bash

if [[ -z $1 ]]; then
    echo "Usage: $0 <fire_number>"
    exit 1
fi

if [[ -d "frames/$1" ]]; then
    echo "error: fire with that number already exists"
    exit 1
fi

mkdir "frames/$1"
mkdir "frames/${1}/png"
mkdir "frames/${1}/txt"

if magick "fire2.gif" "frames/${1}/png/fire.png"; then
    for image in frames/${1}/png/*; do
        for x in {5..100}; do
            for y in {4..30}; do
                jp2a $image --colors --width=$x --height=$y > "frames/${1}/txt/${x}x${y}.txt"
            done
        done
    done

    echo "Processing done"
else
    echo "Chuj"
fi


