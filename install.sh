#!/usr/bin/env bash
# Install this terminal setup on a new machine.
# Usage:  ./install.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "▶ Installing prerequisites (oh-my-posh + Meslo Nerd Font)…"
if ! command -v brew >/dev/null 2>&1; then
  echo "  Homebrew is required. Install it from https://brew.sh first." >&2
  exit 1
fi
command -v oh-my-posh >/dev/null 2>&1 || brew install oh-my-posh
brew list --cask font-meslo-lg-nerd-font >/dev/null 2>&1 || brew install --cask font-meslo-lg-nerd-font

echo "▶ Copying themes to ~/.config/oh-my-posh/…"
mkdir -p "$HOME/.config/oh-my-posh"
cp "$REPO_DIR/themes/"*.omp.* "$HOME/.config/oh-my-posh/"

echo "▶ Setting the default prompt theme…"
echo "$HOME/.config/oh-my-posh/catppuccin_mocha.omp.yaml" > "$HOME/.config/oh-my-posh-theme"

LINE="source \"$REPO_DIR/shell/prompt.zsh\""
if ! grep -qF "$LINE" "$HOME/.zshrc" 2>/dev/null; then
  echo "▶ Adding prompt loader to ~/.zshrc…"
  printf '\n# Terminal prompt (oh-my-posh) — managed by terminal-config repo\n%s\n' "$LINE" >> "$HOME/.zshrc"
else
  echo "▶ ~/.zshrc already sources the prompt — skipping."
fi

echo
echo "✅ Done. Now:"
echo "   1. Set your terminal font to 'MesloLGS Nerd Font'"
echo "      (VS Code: \"terminal.integrated.fontFamily\": \"MesloLGS Nerd Font\")"
echo "   2. Run:  exec zsh"
