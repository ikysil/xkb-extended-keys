#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR="$SCRIPT_DIR/build"
BACKUP_FILE="$OUTPUT_DIR/backup"

[ -d "$OUTPUT_DIR" ] || mkdir "$OUTPUT_DIR"

# Create backup inside this folder
setxkbmap -print > "$BACKUP_FILE"

# Compile the custom XKB configuration
xkbcomp -I"$SCRIPT_DIR" "$SCRIPT_DIR/keymap/xkbcustom" $DISPLAY
