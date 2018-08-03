#!/bin/bash

# Cross-compile rust cargo project for Raspberry-Pi

if [[ $# -eq 0 ]] || [[ ! -e "$1" ]]; then
    echo "Usage $0 <folder>"
    exit 1
fi

folder=$(realpath "$1")
basepath=$(dirname "$0")"/arm"

echo "Cross-compiling '$folder':"

# Build docker image
docker build -t "setine/rust-arch-arm:nightly" "$basepath"

# Cross-compile using docker image
docker run -it --rm -v "$folder":/source setine/rust-arch-arm:nightly
