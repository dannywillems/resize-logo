#!/bin/bash

# Input SVG file (provide as first argument)
INPUT_SVG="$1"

# Output directory for resized banners (provide as second argument)
OUTPUT_DIR="$2"

# Optional color to replace (provide as third argument, default: no change)
COLOR="$3"

# Check if required parameters are provided
if [ -z "$INPUT_SVG" ] || [ -z "$OUTPUT_DIR" ]; then
    echo "Usage: $0 <input_svg> <output_dir> [color]"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# If a color is provided, modify the SVG file with the specified color
if [ -n "$COLOR" ]; then
    MODIFIED_SVG="$OUTPUT_DIR/modified_input.svg"
    echo "Updating SVG color to $COLOR..."
    sed -E 's/fill="[^"]+"/fill="'$COLOR'"/g; s/fill:[^;]*;/fill:'$COLOR';/g' "$INPUT_SVG" > "$MODIFIED_SVG"
    INPUT_SVG="$MODIFIED_SVG"
    # Replace '#' in the color code with an empty string for file naming
    COLOR_NAME=$(echo "$COLOR" | sed 's/#//g')
else
    COLOR_NAME="default"
fi

# Define sizes for each platform
sizes=(
    "Bluesky:1200x400"
    "Discord:1920x1080"
    "Facebook:820x312"
    "GitHub:1500x500"
    "Instagram:1080x566"
    "LinkedIn:1128x191"
    "Mastodon:1500x500"
    "Reddit:1280x720"
    "Threads:1080x608"
    "Twitch:1200x480"
    "Twitter:1500x500"
    "YouTube:2560x1440"
)

# Loop through each platform and generate resized banners
for size in "${sizes[@]}"; do
    platform=$(echo $size | cut -d: -f1 | tr '[:upper:]' '[:lower:]')
    dimensions=$(echo $size | cut -d: -f2)
    width=$(echo $dimensions | cut -dx -f1)
    height=$(echo $dimensions | cut -dx -f2)
    output_file="$OUTPUT_DIR/${platform}_banner_${dimensions}_${COLOR_NAME}.png"

    # Check if the file already exists
    if [ -f "$output_file" ]; then
        echo "Skipping $platform banner with size $dimensions and color $COLOR_NAME (already exists)."
        continue
    fi

    echo "Generating $platform banner with size $dimensions and color $COLOR_NAME..."

    # Convert SVG to PNG with proper centering and aspect ratio
    convert "$INPUT_SVG" \
        -resize "${width}x${height}^" \
        -gravity center \
        -background none \
        -extent "${width}x${height}" \
        "$output_file"

    if [[ $? -eq 0 ]]; then
        echo "$platform banner saved to $output_file"
    else
        echo "Failed to generate $platform banner."
    fi
done

echo "All banners have been resized, centered, and saved in the '$OUTPUT_DIR' directory."
