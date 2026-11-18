#!/usr/bin/env bash
# Start StarNet so its CLAUDE CODE provider runs on your Claude subscription (claude.ai login), not a paid API key.
#
# Why: ~/.zshrc exports ANTHROPIC_API_KEY, and a StarNet started from a terminal hands that key to the `claude`
# CLI — every agent turn is then billed per token to the API account instead of using the subscription.
# This script drops the key (and any ANTHROPIC_BASE_URL) for StarNet only; your shell is untouched.
#
# One-time setup: run `claude auth login` and sign in with your Claude account in the browser.
set -euo pipefail
cd "$(dirname "$0")/.."
[ -d node_modules ] || npm ci --ignore-scripts
exec env -u ANTHROPIC_API_KEY -u ANTHROPIC_BASE_URL -u ANTHROPIC_AUTH_TOKEN node sidecar/index.js
