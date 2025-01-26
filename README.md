# Social Media Logo and Banner Resizer

This repository contains scripts for resizing SVG files into platform-specific
dimensions for logos and banners. Both scripts support centering the content,
preserving aspect ratios, and optional color customization for the SVG.

## Requirements

- **ImageMagick**: Ensure ImageMagick is installed on your system. You can
  install it on Ubuntu with the following command:
  ```bash
  sudo apt-get install imagemagick
  ```

## Scripts Overview

### 1. `resize_social_logos.sh`

This script resizes a given SVG logo into square dimensions suitable for
different social media platforms.

#### Usage

```bash
./resize_social_logos.sh <input_svg> <output_dir> [color]
```

#### Parameters

- `<input_svg>`: Path to the input SVG file.
- `<output_dir>`: Directory where resized logos will be saved.
- `[color]` (optional): Color code (e.g., `#FF0000` for red).

#### Example

```bash
./resize_social_logos.sh company_logo.svg social_logos #FF0000
```

This resizes `company_logo.svg`, changes its color to red, and saves the files
in the `social_logos` directory.

#### Logo Sizes

The script generates PNG files with the following dimensions for each platform:

| Platform   | Dimensions |
|------------|------------|
| Bluesky    | 420x420    |
| Discord    | 512x512    |
| Facebook   | 512x512    |
| GitHub     | 500x500    |
| Instagram  | 1080x1080  |
| LinkedIn   | 300x300    |
| Mastodon   | 400x400    |
| Reddit     | 256x256    |
| Threads    | 1080x1080  |
| Twitch     | 600x600    |
| Twitter    | 400x400    |
| YouTube    | 800x800    |

#### File Naming Convention

```
<platform>_logo_<dimensions>_<color>.png
```

For example:
- `twitter_logo_400x400_ff0000.png`
- `github_logo_500x500_default.png`

If no color is provided, files are named with `_default`.

### 2. `resize_social_banner.sh`

This script resizes a given SVG banner into platform-specific dimensions, ensuring proper centering and aspect ratio preservation.

#### Usage

```bash
./resize_social_banner.sh <input_svg> <output_dir> [color]
```

#### Parameters

- `<input_svg>`: Path to the input SVG file.
- `<output_dir>`: Directory where resized banners will be saved.
- `[color]` (optional): Color code (e.g., `#FF0000` for red).

#### Example

```bash
./resize_social_banner.sh company_banner.svg banners #FF0000
```

This resizes `company_banner.svg`, changes its color to red, and saves the files in the `banners` directory.

#### Expected Input

The input file must have an aspect ratio close to **16:9** or **4:1**,
depending on the platform requirements. For best results, use SVGs designed
with banner layouts.

#### Banner Sizes

The script generates PNG files with the following dimensions for each platform:

| Platform   | Dimensions      |
|------------|-----------------|
| Bluesky    | 1200x400        |
| Discord    | 1920x1080       |
| Facebook   | 820x312         |
| GitHub     | 1500x500        |
| Instagram  | 1080x566        |
| LinkedIn   | 1128x191        |
| Mastodon   | 1500x500        |
| Reddit     | 1280x720        |
| Threads    | 1080x608        |
| Twitch     | 1200x480        |
| Twitter    | 1500x500        |
| YouTube    | 2560x1440       |

#### File Naming Convention

```
<platform>_banner_<dimensions>_<color>.png
```

For example:
- `twitter_banner_1500x500_ff0000.png`
- `youtube_banner_2560x1440_default.png`

If no color is provided, files are named with `_default`.

## Notes

- Both scripts skip files that already exist in the output directory.
- Ensure the input SVG file exists and is valid.
- The output directory will be created automatically if it doesn't exist.

## Troubleshooting

1. Verify that ImageMagick is installed and functional:
   ```bash
   convert -version
   ```
2. Ensure the input SVG file path is correct.
3. Check script permissions:
   ```bash
   chmod +x resize_social_logos.sh banner_resizer.sh
   ```

