# Dotfiles

Configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/), themed with [Yoru](https://github.com/raexera/yoru) colors.

## Quick Start

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

The install script handles Homebrew, packages, stowing, and setting zsh as default.

## Manual Setup

```bash
cd ~/.dotfiles
stow */              # stow everything
stow zsh starship    # or pick specific packages
stow -D packagename  # remove a package
```

## Structure

| Package | Description |
|---------|-------------|
| `zsh/` | Shell config (ZDOTDIR-based, only `.zshenv` in ~) |
| `starship/` | Prompt |
| `ghostty/` | Terminal |
| `bat/` | Syntax highlighting |
| `fastfetch/` | System info |
| `git/` | Git config |
| `spotify-player/` | Terminal Spotify |
| `opencode/` | AI coding assistant theme |

## Portability

The zsh config auto-detects platform (macOS/Linux) and gracefully handles missing tools with fallbacks. Works on a fresh machine with just git and curl.
