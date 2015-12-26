#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR="$SCRIPT_DIR/build"
GEN_CONFIG="$OUTPUT_DIR/xkbcustom_generated"
BACKUP_FILE="$OUTPUT_DIR/backup"

if [[ $# -eq 0 ]]; then
  LAYOUT=us
else
  LAYOUT="$1"
fi

[ -d "$OUTPUT_DIR" ] || mkdir "$OUTPUT_DIR"

# Create backup
setxkbmap -print > "$BACKUP_FILE"

# Create xkb file for the given layout
cat "$SCRIPT_DIR/keymap/xkbcustom" | sed "s/LAYOUT/$LAYOUT/" > "$GEN_CONFIG"

# Compile the custom XKB configuration
xkbcomp -I"$SCRIPT_DIR" "$GEN_CONFIG" $DISPLAY
