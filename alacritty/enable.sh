#!/bin/bash
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
COLORS_PATH="~/.config/alacritty/colors.toml"
IMPORT_BLOCK=$'[general]\nimport = ["'"$COLORS_PATH"'"]'

# create config if it doesn't exist
if [ ! -f "$ALACRITTY_CONFIG" ]; then
    mkdir -p "$(dirname "$ALACRITTY_CONFIG")"
    echo "$IMPORT_BLOCK" > "$ALACRITTY_CONFIG"
    echo "Created $ALACRITTY_CONFIG with import block"
    exit 0
fi

# check if import line is already present
if grep -qF 'colors.toml' "$ALACRITTY_CONFIG"; then
    echo "Import already present, skipping"
    exit 0
fi

# prepend to the top of the file so it's picked up first
echo -e "$IMPORT_BLOCK\n\n$(cat "$ALACRITTY_CONFIG")" > "$ALACRITTY_CONFIG"
echo "Added import block to $ALACRITTY_CONFIG"
