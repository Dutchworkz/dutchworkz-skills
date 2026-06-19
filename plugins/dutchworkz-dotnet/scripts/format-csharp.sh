#!/usr/bin/env bash
# DutchWorkz auto-format hook
# Draait na elke Write/Edit-actie van de agent: formatteert .cs-bestanden
# volgens de .editorconfig in de repo-root.

set -euo pipefail

if command -v jq >/dev/null 2>&1; then
    file=$(jq -r '.tool_input.file_path // empty')
else
    file=$(sed -n 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
fi

[[ "$file" == *.cs ]] || exit 0
[[ -f "$file" ]] || exit 0

dotnet format whitespace --include "$file" --no-restore --verbosity quiet || true
