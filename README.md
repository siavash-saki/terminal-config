# terminal-config

My terminal prompt setup — [Oh My Posh](https://ohmyposh.dev) on zsh (macOS).

The main theme is a **customized Catppuccin Mocha**: the layout and features of
[pkazmier's Catppuccin theme](https://github.com/JanDeDobbeleer/oh-my-posh/discussions/5578)
recolored to match the **"jan" Oh My Posh homepage** palette
(gold → orange → green → blue), with the **full path** shown in the directory segment.

## Contents

| Path | What it is |
|------|------------|
| `themes/catppuccin_mocha.omp.yaml` | Main theme — Catppuccin layout + homepage colors + full path |
| `themes/homepage.omp.json` | Recreation of the Oh My Posh homepage demo prompt |
| `shell/prompt.zsh` | Prompt loader + `omp-list` / `omp-try` / `omp-use` helper commands |
| `install.sh` | One-shot installer for a fresh machine |

## Quick install (new machine)

```sh
git clone https://github.com/siavash-saki/terminal-config.git ~/terminal-config
cd ~/terminal-config
./install.sh
exec zsh
```

Then set your terminal font to **MesloLGS Nerd Font**
(VS Code: add `"terminal.integrated.fontFamily": "MesloLGS Nerd Font"` to settings).

## Switching themes

```sh
omp-list                                              # all 122 builtin themes
omp-try tokyonight_storm                              # preview for this session only
omp-use ~/.config/oh-my-posh/homepage.omp.json        # set the homepage look permanently
omp-use ~/.config/oh-my-posh/catppuccin_mocha.omp.yaml # back to the main theme
```

## Requirements

- [Homebrew](https://brew.sh)
- `oh-my-posh` — `brew install oh-my-posh`
- A Nerd Font — `brew install --cask font-meslo-lg-nerd-font`
- A true-color terminal for best results (VS Code terminal, Ghostty, iTerm2, WezTerm)
