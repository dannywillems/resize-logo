# Social Logo Resizer

This script resizes a given SVG logo into specific dimensions suitable for
different social media platforms. The generated logos are saved in a specified
output directory.

## Requirements

- **ImageMagick**: Ensure ImageMagick is installed on your system. You can
  install it on Ubuntu with the following command:
  ```bash
  sudo apt-get install imagemagick
  ```

## Usage

```bash
./resize_social_logos_with_color.sh <input_svg> <output_dir> [color]
```

### Parameters

- `<input_svg>`: The path to the input SVG file.
- `<output_dir>`: The directory where resized logos will be saved.
- [color] (optional): Color code (e.g., #FF0000 for red).

### Example

```bash
./resize_social_logos_with_color.sh company_logo.svg social_logos #FF0000
```

This will resize the `company_logo.svg` file and save the resized logos in the
`social_logos` directory.

## Output

The script generates PNG files with the following dimensions for each platform:

| Platform   | Dimensions |
|------------|------------|
| Twitter    | 400x400    |
| Bluesky    | 420x420    |
| Reddit     | 256x256    |
| LinkedIn   | 300x300    |
| Mastodon   | 400x400    |
| GitHub     | 500x500    |

### File Naming Convention

The output files are named using the following format:

```
<platform>_logo_<dimensions>.png
```

For example:

- `twitter_logo_400x400.png`
- `github_logo_500x500.png`

## Notes

- Ensure the input SVG file exists and is valid.
- If the output directory does not exist, it will be created automatically.
- The platform names in the output filenames are in lowercase.

## Troubleshooting

If you encounter issues:

1. Verify that ImageMagick is installed and functional:
   ```bash
   convert -version
   ```

2. Ensure the input SVG file path is correct.

3. Check script permissions:
   ```bash
   chmod +x resize_social_logos.sh
   ```

## License

This script is open-source and available for modification and redistribution.
