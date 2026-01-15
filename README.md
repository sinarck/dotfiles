# Dotfiles

Configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/), themed with [Yoru](https://github.com/raexera/yoru) colors.

## Quick Start

```bash
git clone https://github.com/sinarck/dotfiles.git ~/.dotfiles
```

## Setup

```bash
cd ~/.dotfiles
stow */              # stow everything
stow zsh starship    # or pick specific packages
stow -D packagename  # remove a package
```

## Structure

| Package | Description |
|---------|-------------|
| `bat/` | Syntax highlighting |
| `fastfetch/` | System info |
| `ghostty/` | Terminal emulator |
| `git/` | Git config |
| `opencode/` | AI coding assistant |
| `spotify-player/` | Terminal Spotify client |
| `starship/` | Cross-shell prompt |
| `themes/` | Browser themes (Chrome) |
| `zsh/` | Shell config |

