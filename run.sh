#!/usr/bin/env bash

DEFAULT_DOWNLOAD_FOLDER="$PWD/downloads"
DOWNLOAD_FOLDER=${1:-$DEFAULT_DOWNLOAD_FOLDER}

PATCH_URL="https://sundaysounds.com/pages/insiders-free-patches"

WEBSITE_CONTENT=$(curl -s $PATCH_URL)

LATEST_PATCH_URL=$(echo $WEBSITE_CONTENT | grep -o -m 1 -h -E 'https://cdn.shopify.com/s/files/([A-z0-9_/-]+)\.patch\.zip\?v=([0-9]+)' | head -1)

BASE_FILENAME=$(basename $LATEST_PATCH_URL | grep -o -m 1 -E '[A-z0-9_/-]+' | head -1)
DOWNLOAD_FILEPATH="$DOWNLOAD_FOLDER/$BASE_FILENAME.zip"

echo "Downloading Latest Sunday Keys MainStage Patch $BASE_FILENAME to $DOWNLOAD_FILEPATH"

curl -s "$LATEST_PATCH_URL" > "$DOWNLOAD_FILEPATH"

echo "Unzipping $DOWNLOAD_FILEPATH into $DOWNLOAD_FOLDER"

unzip -q -o "$DOWNLOAD_FILEPATH" -d "$DOWNLOAD_FOLDER"

echo "Removing $DOWNLOAD_FILEPATH"

rm -f "$DOWNLOAD_FILEPATH"

echo "Done!"
