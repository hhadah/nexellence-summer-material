#!/usr/bin/env bash
# Netlify build script for the Nexellence Quarto site.
# Installs a pinned Quarto version (no R/Python needed — the site uses the
# markdown engine) and renders the site into _site/.
set -euo pipefail

QUARTO_VERSION="${QUARTO_VERSION:-1.8.26}"
QUARTO_DIR="$HOME/opt/quarto"

echo "Installing Quarto ${QUARTO_VERSION}..."
mkdir -p "$QUARTO_DIR"
curl -fsSL "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" \
  | tar -xz -C "$QUARTO_DIR" --strip-components=1

export PATH="$QUARTO_DIR/bin:$PATH"

quarto --version
quarto render
