#!/bin/bash

#!/bin/bash

# Input SVG file (provide as first argument)
INPUT_SVG="$1"

# Output directory for resized logos (provide as second argument)
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
    "Twitter:400x400"
    "Bluesky:420x420"
    "Reddit:256x256"
    "LinkedIn:300x300"
    "Mastodon:400x400"
    "GitHub:500x500"
    "YouTube:800x800"
    "Discord:512x512"
    "Facebook:512x512"
    "Twitch:600x600"
)

# Loop through each platform and generate resized logos
for size in "${sizes[@]}"; do
    platform=$(echo $size | cut -d: -f1 | tr '[:upper:]' '[:lower:]')
    dimensions=$(echo $size | cut -d: -f2)
    output_file="$OUTPUT_DIR/${platform}_logo_${dimensions}_${COLOR_NAME}.png"

    echo "Generating $platform logo with size $dimensions and color $COLOR_NAME..."

    # Check if the file already exists
    if [ -f "$output_file" ]; then
        echo "Skipping $platform logo with size $dimensions and color $COLOR_NAME (already exists)."
        continue
    fi

    # Convert SVG to PNG with specified dimensions
    convert -background none -resize "$dimensions" -gravity center -extent "${width}x${height}" "$INPUT_SVG" "$output_file"

    if [[ $? -eq 0 ]]; then
        echo "$platform logo saved to $output_file"
    else
        echo "Failed to generate $platform logo."
    fi
done

echo "All logos have been resized and saved in the '$OUTPUT_DIR' directory."
