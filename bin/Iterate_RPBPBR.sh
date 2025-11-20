#!/bin/sh

FILEPRE=$1
OUTNAME=$2
FILETYPE=$3

DIR="./"
PATTERN="${FILEPRE}_*.${FILETYPE}"
RUN="./bin/RPBPBR" 

for FILE in "$DIR"/$PATTERN; do
    if [ -f "$FILE" ]; then
	BASENAME=$(basename "$FILE")
        echo "Working on file: $BASENAME"
        "$RUN" "$FILE" "${OUTNAME}_${BASENAME}" "$FILETYPE" "keeptemp"
    else
        echo "No matching files found"
    fi
done