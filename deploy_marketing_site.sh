#!/usr/bin/env bash
set -euo pipefail

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST_DIR="${AF_MARKETING_DOCROOT:-/var/www/html/autofoundry}"
DRY_RUN="${DRY_RUN:-0}"
ALLOW_DELETE="${ALLOW_DELETE:-0}"

if [[ ! -d "$DEST_DIR" ]]; then
  echo "ERROR: destination docroot does not exist: $DEST_DIR" >&2
  exit 1
fi

if ! command -v rsync >/dev/null 2>&1; then
  echo "ERROR: rsync is required" >&2
  exit 1
fi

rsync_args=(
  -av
  --omit-dir-times
  --no-perms
  --no-owner
  --no-group
  --exclude ".git/"
  --exclude ".gitignore"
  --exclude "README.md"
  --exclude "deploy_marketing_site.sh"
  --exclude "*.bak-*"
  --exclude "*.psd"
)

if [[ "$DRY_RUN" == "1" ]]; then
  rsync_args+=(--dry-run)
fi

if [[ "$ALLOW_DELETE" == "1" ]]; then
  rsync_args+=(--delete)
fi

echo "Source:      $SRC_DIR/"
echo "Destination: $DEST_DIR/"
echo "Dry run:     $DRY_RUN"
echo "Allow delete:$ALLOW_DELETE"

rsync "${rsync_args[@]}" "$SRC_DIR/" "$DEST_DIR/"

echo "Deploy complete."
