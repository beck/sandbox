#!/bin/bash
set -eu
cd "$(dirname "$0")/.."

merge_opts="--sort-output --no-location --width=80"
pot="locale/templates/LC_MESSAGES/messages.pot"
po="locale/fr/LC_MESSAGES/messages.po"

msgmerge "$po" "$pot" $merge_opts --output-file="$po"
