#!/usr/bin/env bash

SOURCE_PATH="${HOME}/.cache/caffyne-shell/matugen/midnight-discord.css"
THEME_NAME="midnight-discord.css"

if [ ! -f "$SOURCE_PATH" ]; then
    exit 1
fi

declare -A CLIENTS=(
    ["Vencord"]="${HOME}/.config/Vencord/themes"
    ["Vesktop"]="${HOME}/.config/vesktop/themes"
    ["Equicord"]="${HOME}/.config/Equicord/themes"
    ["Equibop"]="${HOME}/.config/equibop/themes"
)

for CLIENT in "${!CLIENTS[@]}"; do
    TARGET_DIR="${CLIENTS[$CLIENT]}"
    TARGET_PATH="${TARGET_DIR}/${THEME_NAME}"

    if [ -d "$TARGET_DIR" ]; then
        cp "$SOURCE_PATH" "$TARGET_PATH"
    fi
done