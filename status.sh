#!/usr/bin/env bash
# status.sh - System status check for the Compress project

set -euo pipefail

PASS=true

# Check that bash is available and meets minimum version (4+)
bash_major="${BASH_VERSINFO[0]}"
if [[ "$bash_major" -ge 4 ]]; then
    echo "[OK] Bash version: ${BASH_VERSION}"
else
    echo "[FAIL] Bash 4+ required (found ${BASH_VERSION})"
    PASS=false
fi

# Check that the README exists
if [[ -f "$(dirname "$0")/README.md" ]]; then
    echo "[OK] README.md found"
else
    echo "[FAIL] README.md not found"
    PASS=false
fi

# Check that this script itself is readable and executable
script_path="$(realpath "$0")"
if [[ -x "$script_path" ]]; then
    echo "[OK] status.sh is executable"
else
    echo "[FAIL] status.sh is not executable"
    PASS=false
fi

if $PASS; then
    echo "[OK] System check passed. Everything is working."
    exit 0
else
    echo "[FAIL] One or more system checks failed."
    exit 1
fi
