#!/bin/bash

GHOSTTY_CONFIG="$HOME/.config/ghostty/config"
THEME_LINE='theme = "Matugen"'

# Create config if it doesn't exist
if [ ! -f "$GHOSTTY_CONFIG" ]; then
    mkdir -p "$(dirname "$GHOSTTY_CONFIG")"
    echo "$THEME_LINE" > "$GHOSTTY_CONFIG"
    echo "Created $GHOSTTY_CONFIG with theme setting"
    exit 0
fi

# Check if the theme is already configured
if grep -qF "$THEME_LINE" "$GHOSTTY_CONFIG"; then
    echo "Theme already present, skipping"
    exit 0
fi

# Append the theme line
echo "" >> "$GHOSTTY_CONFIG"
echo "$THEME_LINE" >> "$GHOSTTY_CONFIG"

echo "Added theme setting to $GHOSTTY_CONFIG"