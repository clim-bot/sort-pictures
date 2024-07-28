#!/bin/bash

# Define the Downloads directory
DOWNLOADS_DIR="$HOME/Downloads"

# Define directories for each picture type
JPEG_DIR="$DOWNLOADS_DIR/JPEG"
PNG_DIR="$DOWNLOADS_DIR/PNG"
GIF_DIR="$DOWNLOADS_DIR/GIF"
HEIC_DIR="$DOWNLOADS_DIR/HEIC"
MOV_DIR="$DOWNLOADS_DIR/MOV"
MP4_DIR="$DOWNLOADS_DIR/MP4"

# Create directories if they don't exist
mkdir -p "$JPEG_DIR"
mkdir -p "$PNG_DIR"
mkdir -p "$GIF_DIR"
mkdir -p "$HEIC_DIR"
mkdir -p "$MOV_DIR"
mkdir -p "$MP4_DIR"

# Function to create year/month directories and move files
move_files() {
    FILE_TYPE_DIR=$1
    FILE_PATTERN=$2

    find "$DOWNLOADS_DIR" -maxdepth 1 -type f -iname "$FILE_PATTERN" | while read file; do
        YEAR=$(date -r "$file" +"%Y")
        MONTH=$(date -r "$file" +"%m")
        DAY=$(date -r "$file" +"%d")

        DEST_DIR="$FILE_TYPE_DIR/$YEAR-$MONTH-$DAY"
        mkdir -p "$DEST_DIR"
        mv "$file" "$DEST_DIR"
    done
}

# Move JPEG files
move_files "$JPEG_DIR" "*.jpg"
move_files "$JPEG_DIR" "*.jpeg"

# Move PNG files
move_files "$PNG_DIR" "*.png"

# Move GIF files
move_files "$GIF_DIR" "*.gif"

# Move HEIF files
move_files "$HEIC_DIR" "*.HEIC"

# Move MOV files
move_files "$MOV_DIR" "*.MOV"

# Move MP4 files
move_files "$MP4_DIR" "*.mp4"

echo "Pictures sorted successfully!"
