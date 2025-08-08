# Dotfiles

Personal configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

This repository contains configuration files organized as Stow packages:

- **`ghostty/`** - [Ghostty terminal emulator](https://mitchellh.com/ghostty) configuration
- **`starship/`** - [Starship cross-shell prompt](https://starship.rs/) configuration  
- **`zsh/`** - Zsh shell configuration with znap plugin manager

## Installation

### Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Zsh](https://zsh.sourceforge.io/)
- [Starship](https://starship.rs/)
- [Ghostty](https://mitchellh.com/ghostty) (optional)

Install GNU Stow:
```bash
# macOS
brew install stow

# Ubuntu/Debian
sudo apt install stow

# Arch Linux
sudo pacman -S stow
```

### Setup

1. Clone this repository to your home directory:
```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Use Stow to symlink configurations:
```bash
# Install all configurations
stow */

# Or install specific packages
stow zsh
stow starship
stow ghostty
```

## Package Details

### Zsh (`zsh/`)
- **Location**: `~/.zshrc`
- **Features**:
  - [znap](https://github.com/marlonrichert/zsh-snap) plugin manager for fast Zsh startup
  - Environment variables for development tools (Homebrew, Node.js, Python, Java, Android)
  - History configuration
  - Path configuration for various tools

### Starship (`starship/`)
- **Location**: `~/.config/starship.toml`
- **Features**:
  - Custom prompt format with Git branch, directory, and runtime information
  - Support for multiple programming languages (Python, Node.js, Rust, Java, etc.)
  - Command duration display

### Ghostty (`ghostty/`)
- **Location**: `~/.config/ghostty/config`
- **Features**:
  - GeistMono NF font at 14pt
  - GitHub Dark theme
  - macOS-specific titlebar configuration
  - Custom keybindings

## Usage

After installation, restart your terminal or source your shell configuration:
```bash
source ~/.zshrc
```

## Uninstalling

To remove symlinks for a specific package:
```bash
cd ~/.dotfiles
stow -D packagename
```

To remove all symlinks:
```bash
cd ~/.dotfiles
stow -D */
```

## Customization

Each package can be customized by editing the files in their respective directories. Changes will be reflected immediately since Stow creates symlinks to the original files.