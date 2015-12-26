#!/usr/bin/env bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
OUTPUT_DIR="$SCRIPT_DIR/build"
BACKUP_FILE="$OUTPUT_DIR/backup"

if [ -f $BACKUP_FILE ]; then
  # Compile the backup XKB configuration
  xkbcomp -I"$SCRIPT_DIR" "$BACKUP_FILE" $DISPLAY
else
  echo File $BACKUP_FILE does not exist.
fi
