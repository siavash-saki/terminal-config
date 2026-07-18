# ── Prompt: Oh My Posh ────────────────────────────────────────────────
# Source this from your ~/.zshrc:   source ~/terminal-config/shell/prompt.zsh
# Requires: oh-my-posh (brew install oh-my-posh) and a Nerd Font in your terminal.

OMP_THEMES_DIR="$(brew --prefix oh-my-posh 2>/dev/null)/themes"
OMP_THEME_FILE="$HOME/.config/oh-my-posh-theme"

# Resolve a theme reference (a builtin name, OR a path to a .omp.json/.omp.yaml) to a config file
_omp_resolve() {
  case "$1" in
    */*|*.omp.*) print -r -- "${1/#\~/$HOME}" ;;             # a path (custom theme)
    *)           print -r -- "$OMP_THEMES_DIR/$1.omp.json" ;; # a builtin theme name
  esac
}

# Default prompt: your customized Catppuccin + "jan" homepage colors
OMP_THEME="$(cat "$OMP_THEME_FILE" 2>/dev/null || echo "$HOME/.config/oh-my-posh/catppuccin_mocha.omp.yaml")"
eval "$(oh-my-posh init zsh --config "$(_omp_resolve "$OMP_THEME")")"

# omp-list              → list every installed builtin theme name
omp-list() { ls "$OMP_THEMES_DIR"/*.omp.json | xargs -n1 basename | sed 's/.omp.json//'; }
# omp-try <name|path>   → try a theme for THIS session only (reset with: exec zsh)
omp-try()  { local f="$(_omp_resolve "$1")"; [ -f "$f" ] || { echo "No theme '$1' — run omp-list"; return 1; }; eval "$(oh-my-posh init zsh --config "$f")"; }
# omp-use <name|path>   → set a theme permanently (persists across new terminals)
omp-use()  { local f="$(_omp_resolve "$1")"; [ -f "$f" ] || { echo "No theme '$1' — run omp-list"; return 1; }; echo "$1" > "$OMP_THEME_FILE"; omp-try "$1"; echo "✔ '$1' is now your default prompt."; }
